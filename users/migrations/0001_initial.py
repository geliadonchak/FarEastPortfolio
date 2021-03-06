# Generated by Django 2.2.2 on 2019-06-27 07:55

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(default='default.png', upload_to='profile_pics')),
                ('biography', models.TextField(blank=True)),
                ('organization', models.CharField(blank=True, max_length=150)),
                ('position', models.CharField(blank=True, max_length=100)),
                ('degree', models.CharField(blank=True, max_length=100)),
                ('link', models.URLField(blank=True)),
                ('ORCID', models.CharField(blank=True, max_length=100)),
                ('access', models.CharField(choices=[('Пользователь', 'Пользователь'), ('Модератор', 'Модератор'), ('Администратор', 'Администратор')], default='standart', max_length=20)),
                ('user', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Grant',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('year_from', models.IntegerField()),
                ('year_to', models.IntegerField()),
                ('fund', models.CharField(max_length=200)),
                ('amount', models.IntegerField()),
                ('link', models.URLField(blank=True)),
                ('profile', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.Profile')),
            ],
            options={
                'ordering': ['amount'],
            },
        ),
    ]
