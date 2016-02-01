from readthedocs.settings.sqlite import *

import os
environ = os.environ

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': environ['DB_ENV_DB_NAME'],
        'USER': environ['DB_ENV_DB_USER'],
        'PASSWORD': environ['DB_ENV_DB_PASS'],
        'HOST': 'db',
        'PORT': 5432,
    }
}
SITE_ROOT = '/app'
ES_HOSTS = ['elasticsearch:9200']
REDIS = {
    'host': 'redis',
    'port': 6379,
    'db': 0,
}
BROKER_URL = 'redis://redis:6379/0'
CELERY_RESULT_BACKEND = 'redis://redis:6379/0'
DEBUG = True
CELERY_ALWAYS_EAGER = False
