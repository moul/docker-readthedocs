FROM ubuntu:quantal
MAINTAINER Manfred Touron <m@42.am>

RUN apt-get update
RUN apt-get install -y python-virtualenv git
RUN adduser --gecos 'py' --disabled-password py

RUN apt-get install -y python-dev
RUN apt-get install -y libxml2-dev libxslt1-dev expat libevent-dev
RUN apt-get install -y texlive texlive-latex-extra
RUN apt-get install -y language-pack-en
RUN locale-gen en_US
RUN su - py -c 'virtualenv venv'
RUN su - py -c 'git clone http://github.com/rtfd/readthedocs.org app'
RUN su - py -c 'venv/bin/pip install -r app/pip_requirements.txt'

RUN printf "from readthedocs.settings.sqlite import *\nSITE_ROOT = '/home/py/app/readthedocs'"  > /home/py/app/config.py
ENV DJANGO_SETTINGS_MODULE config

RUN su - py -c 'cd /home/py/app; /home/py/venv/bin/python manage.py syncdb --noinput'
RUN su - py -c 'cd /home/py/app; /home/py/venv/bin/python manage.py migrate'
RUN su - py -c 'cd /home/py/app; /home/py/venv/bin/python manage.py loaddata test_data'
RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@localhost', 'admin')" | su - py -c 'cd /home/py/app; /home/py/venv/bin/python manage.py shell'

EXPOSE 8000
ENTRYPOINT ["/bin/rtd-start"]
CMD [""]
ADD config /
