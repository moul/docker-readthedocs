#!/bin/bash
cd $APPDIR

set -e

unzip /tmp/master.zip >/dev/null 2>/dev/null && \
mv readthedocs.org-master/* readthedocs.org-master/.??* . && \
rmdir readthedocs.org-master

PYTHON=/venv/bin/python
PIP=/venv/bin/pip

cp -f /etc/default/rtd-config.py $APPDIR/readthedocs/config.py
$PIP install -U \
    --allow-external bzr --allow-unverified bzr \
    -r $APPDIR/requirements.txt
cd $APPDIR && /venv/bin/python setup.py develop
cd $APPDIR/readthedocs
chown -R py $APPDIR
$PIP install psycopg2
/usr/bin/pip install psycopg2
/usr/bin/pip install git+https://github.com/rtfd/readthedocs-sphinx-ext.git
ln -s /app/readthedocs/core/static /app/media/
mkdir -p /app/prod_artifacts/media

/app/readthedocs/templates/sphinx/update_theme.sh
