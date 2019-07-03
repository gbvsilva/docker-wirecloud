#!/bin/sh
cd wirecloud_instance
python manage.py populate
python manage.py runserver 0.0.0.0:8000 --insecure
