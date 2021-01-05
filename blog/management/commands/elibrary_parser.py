import re

from django.contrib.auth.models import User
from django.core.management import BaseCommand
import requests

from users.models import Profile

SITE_URL = 'https://www.elibrary.ru'
AUTHOR_URL = '/author_items.asp?authorid={author_id}&pagenum={page}'
ARTICLE_URL = '/item.asp?id={article_id}'

SEARCH_PAGE_REGEXP = r'<a href=\"\/item\.asp\?id=(?P<article_id>[^\"]*)\">'
LAST_PAGE_REGEXP = r'<a href=\"javascript:goto_page\((?P<last_page>\d*)\)\"[^>]*>В&nbsp;конец'


class Command(BaseCommand):
    parsed_articles = []

    @staticmethod
    def get_query(template: str, data: dict):
        url = SITE_URL + template
        for key in data.keys():
            if url.find(key):
                url = url.replace(key, str(data[key]))
        return url

    def add_arguments(self, parser):
        parser.add_argument(
            '-user',
            action='store',
            default=None,
            type=int,
            required=True,
            help='ID of user'
        )

    def parse_author_page(self, elibrary_id):
        page = requests.get(self.get_query(AUTHOR_URL, {
            'author_id': elibrary_id,
            'page': 1
        })).text

        last_page = 1
        last_page_match = re.search(LAST_PAGE_REGEXP, page)
        if last_page_match is not None:
            last_page = last_page_match['last_page']

        matches = re.search(SEARCH_PAGE_REGEXP, page)
        for match in matches:
            print(match)
            # self.parse_article(match['article_id'])

        for page_num in range(2, last_page + 1):
            pass
            # todo parse article page

    def parse_article(self, article_id: str):
        page = requests.get(self.get_query(ARTICLE_URL, {
            'article_id': article_id
        })).text

    def handle(self, *args, **options):
        user = User.objects.filter(pk=int(options['user'])).all().values()
        if len(user) != 1:
            print("Пользователь с id {} не найден".format(options['user']))
            return

        profile = Profile.objects.filter(user=user[0]['id']).all().values()
        if len(profile) != 1:
            print("Пользователь с id {} не заполнил профиль".format(options['user']))
            return

        elibrary_id = profile[0]['elibrary_id']
        if elibrary_id is None or elibrary_id == 0:
            print("Неправильный Elibrary ID")
            return

        self.parse_author_page(elibrary_id)
