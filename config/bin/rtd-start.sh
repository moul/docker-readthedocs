#!/bin/bash

su - py -c 'cd /app/readthedocs; /venv/bin/python manage.py runserver 0.0.0.0:8000'
