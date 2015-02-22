from readthedocs.settings.docker import *
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
SITE_ROOT = '/app/readthedocs'
