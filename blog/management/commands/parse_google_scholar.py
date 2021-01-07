from django.contrib.auth.models import User
from django.core.management.base import BaseCommand
import requests
import re

from blog.models import Post

SITE_URL = 'https://scholar.google.com'
SEARCH_URL = '/scholar?hl=ru&q={query}'

SEARCH_PAGE_REGEXP = r'<h3[^>]*gs_rt.*?<a[^>]*href=\"(?P<url>[^\"]*)\"[^>]*>(?P<title>[^<]*)<\/a.*?<div[^>]*class=\"gs_a\"[^>]*>(?P<authors>[^-]*)-(?P<other>.*?)-'
SEARCH_NEXT_PAGE_REGEXP = r'<a href=\"(?P<nextPage>[^\"]*)\"><span[^>]*gs_ico_nav_next[^>]*></span><b[^>]*>Следующая</b></a></td>'
CONTENT_TEMPLATE = "Полный текст статьи можно найти по ссылке: <a href=\"{}\">{}</a>"
MAX_PAGE_NUMBER = 3

NAMES_MAPPER = {
    'url': 0,
    'title': 1,
    'authors': 2,
    'other': 3,
}


class Command(BaseCommand):
    parsed_posts = []
    current_user_id = None

    def add_arguments(self, parser):
        parser.add_argument(
            '-user',
            action='store',
            default=None,
            help='ID of user',
            required=True
        )

    def parse_search_pages(self, query):
        url = SITE_URL + SEARCH_URL.replace('{query}', query.replace(' ', '+'))
        page_number = 1

        while page_number <= MAX_PAGE_NUMBER:
            print("[GoogleScalarParser] Query: " + query + "; page: " + str(page_number))
            page = requests.get(url).text
            for match in re.findall(SEARCH_PAGE_REGEXP, page):
                self.save_post(match)

            next_page_match = re.search(SEARCH_NEXT_PAGE_REGEXP, page)
            if next_page_match is None:
                break

            url = SITE_URL + next_page_match.group('nextPage').replace('&amp;', '&')
            page_number += 1

    def save_post(self, match):
        post = Post()

        url = self.clean_str(str(match[NAMES_MAPPER['url']]))

        post.title = self.clean_str(str(match[NAMES_MAPPER['title']]))
        post.content = CONTENT_TEMPLATE.format(url, url)

        other_info = str(match[NAMES_MAPPER['other']]).strip()
        year_match = re.search(r'\d{4}', other_info)
        if year_match is not None:
            post.date = int(year_match[0])

        self.parsed_posts.append(post)

    @staticmethod
    def clean_str(s: str):
        return re.sub(
            r'<[^>]*>',
            '',
            s.strip()
        )

    def handle(self, *args, **options):
        user = User.objects.filter(pk=int(options['user'])).all().values()
        if len(user) != 1:
            print("[GoogleScalarParser] Пользователь с id {} не найден".format(options['user']))
            return
        query = user[0]['first_name'] + ' ' + user[0]['last_name']
        self.current_user_id = user[0]['id']

        print("[GoogleScalarParser] Начало парсинга для пользователя {}".format(options['user']))

        self.parse_search_pages(query)

        count = 0
        for post in self.parsed_posts:
            post.author_id = self.current_user_id

            if len(Post.objects.filter(title=post.title).all().values()) == 0:
                count += 1
                post.save()

        print("[GoogleScalarParser] Сохранено {} статей".format(count))
