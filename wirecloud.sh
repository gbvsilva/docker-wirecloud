#!/bin/sh
cd wirecloud_instance
python3 manage.py populate
python3 manage.py runserver 0.0.0.0:8000 --insecure
