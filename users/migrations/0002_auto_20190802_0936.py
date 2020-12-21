# Generated by Django 2.2.2 on 2019-08-01 23:36

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Organization',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('date', models.DateTimeField(default=django.utils.timezone.now)),
                ('constitutors', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('link', models.URLField()),
                ('description', models.TextField()),
            ],
        ),
        migrations.AlterField(
            model_name='profile',
            name='organization',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='users.Organization'),
        ),
    ]