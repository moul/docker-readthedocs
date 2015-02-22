#!/bin/bash

cd /app/readthedocs

PYTHON=/venv/bin/python
$PYTHON manage.py syncdb --noinput
$PYTHON manage.py migrate
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@localhost', 'admin')" | $PYTHON manage.py shell
$PYTHON manage.py loaddata test_data

/venv/bin/python manage.py runserver 0.0.0.0:8000
