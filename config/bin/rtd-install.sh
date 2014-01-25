cd $APPDIR

set -e

PYTHON=/venv/bin/python
PIP=/venv/bin/pip

cp -f /etc/default/rtd-config.py $APPDIR/config.py
$PIP install -U \
    --allow-external bzr --allow-unverified bzr \
    -r $APPDIR/pip_requirements.txt
$PYTHON manage.py syncdb --noinput
$PYTHON manage.py migrate
$PYTHON manage.py loaddata test_data
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@localhost', 'admin')" | $PYTHON manage.py shell
chown -R py $APPDIR
