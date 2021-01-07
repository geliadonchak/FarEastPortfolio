# Generated by Django 2.1.5 on 2021-01-07 03:52

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20190802_0936'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organization',
            name='address',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='organization',
            name='constitutors',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='organization',
            name='date',
            field=models.DateTimeField(blank=True, default=django.utils.timezone.now, null=True),
        ),
        migrations.AlterField(
            model_name='organization',
            name='description',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='profile',
            name='access',
            field=models.CharField(choices=[('Пользователь', 'Пользователь'), ('Модератор', 'Модератор'), ('Администратор', 'Администратор')], default='Пользователь', max_length=20),
        ),
    ]
