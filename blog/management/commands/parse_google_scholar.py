from django.contrib.auth.models import User
from django.core.management.base import BaseCommand
import requests
import re

SITE_URL = 'https://scholar.google.com'
SEARCH_URL = '/scholar?hl=ru&q={query}'

SEARCH_PAGE_REGEXP = r'href=\"(?P<url>https:\/\/elibrary\.ru\/item\.asp\?id=[^\"]*)\"'
SEARCH_NEXT_PAGE_REGEXP = r'<a href=\"(?P<nextPage>[^\"]*)\"><span[^>]*gs_ico_nav_next[^>]*></span><b[^>]*>Следующая</b></a></td>'
ELIBRARY_REGEXP = r''
MAX_PAGE_NUMBER = 5


class Command(BaseCommand):
    parsed_urls = []

    def parse_search_pages(self, users):
        for user in users:
            query = user['first_name'] + ' ' + user['last_name']
            url = SITE_URL + SEARCH_URL.replace('{query}', query.replace(' ', '+'))
            page_number = 1

            while page_number <= MAX_PAGE_NUMBER:
                print("Query: " + query + "; page: " + str(page_number))
                page = requests.get(url).text
                for match in re.findall(SEARCH_PAGE_REGEXP, page):
                    self.parsed_urls.append(match)

                nextPageMatch = re.search(SEARCH_NEXT_PAGE_REGEXP, page)
                if nextPageMatch is None:
                    break

                url = SITE_URL + nextPageMatch.group('nextPage').replace('&amp;', '&')
                page_number += 1

    def handle(self, *args, **kwargs):
        users = User.objects.filter(is_staff=False).all().values()
        self.parse_search_pages(users)
        print()

        self.parsed_urls = list(set(self.parsed_urls))

        for url in self.parsed_urls:
            print('Parsing url ' + url)
            # TODO save posts
            # TODO parse by username
            # TODO add parser to cron on server
