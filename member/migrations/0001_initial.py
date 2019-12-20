# Generated by Django 3.0.1 on 2019-12-20 01:53

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
                ('is_use', models.BooleanField()),
                ('create_time', models.DateField()),
                ('update_time', models.DateField()),
                ('status', models.BooleanField()),
            ],
        ),
    ]
