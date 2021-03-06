# Generated by Django 3.0.1 on 2020-01-04 13:12

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('username', models.CharField(max_length=255)),
                ('password', models.CharField(max_length=255)),
                ('name', models.CharField(max_length=63)),
                ('sex', models.BooleanField()),
                ('tel', models.CharField(max_length=20)),
                ('email', models.CharField(max_length=255)),
                ('address', models.CharField(max_length=255)),
                ('create_time', models.DateField(auto_now_add=True)),
                ('update_time', models.DateField(auto_now=True)),
                ('status', models.BooleanField(default=1)),
            ],
        ),
    ]
