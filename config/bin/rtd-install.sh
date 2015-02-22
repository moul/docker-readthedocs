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
    -r $APPDIR/pip_requirements.txt
cd $APPDIR && /venv/bin/python setup.py develop
cd $APPDIR/readthedocs
chown -R py $APPDIR
$PIP install psycopg2
/usr/bin/pip install readthedocs-sphinx-ext psycopg2
