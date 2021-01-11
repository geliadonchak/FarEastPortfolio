# Requirements
Tested with:
* Python 3.7.7
* Django 2.1.5
* Django crispy forms 1.7.2
* Django Tinymce 2.8.0
* Django Autocomplete Light 3.5.0
* Pillow 6.2.2
* Requests 2.25.1
* Transliterate 1.10.2
* Bootstrap templates

# Installation for development

Install mariadb-server, create user and database
Fill db credentials in settings.py
Import dump.sql
```
mysql -u[user] -p[password] [database_name] < dump.sql
```

Available test users (use "525234" as password for all users):
- admin
- moder
- sushchenko.aa

Install python requirements and run server
```
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```
