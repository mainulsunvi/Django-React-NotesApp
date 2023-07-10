#!/bin/ash

python manage.py migrate
nohup python manage.py runserver 0.0.0.0:8000
