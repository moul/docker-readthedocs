FROM moul/python-dev
MAINTAINER Manfred Touron <m@42.am>

RUN apt-get update
RUN adduser --gecos 'py' --disabled-password py
RUN apt-get -qq install -y git libxml2-dev \
    libxslt1-dev expat libevent-dev texlive \
    texlive-latex-extra language-pack-en unzip

ADD https://github.com/rtfd/readthedocs.org/archive/master.zip app
RUN cd app && unzip master.zip && rm -f master.zip && mv readthedocs.org-master/* readthedocs.org-master/.??* .
RUN /venv/bin/pip install -r app/pip_requirements.txt

RUN printf "from readthedocs.settings.sqlite import *\nSITE_ROOT = '/home/py/app/readthedocs'"  > /home/py/app/config.py
ENV DJANGO_SETTINGS_MODULE config

EXPOSE 8000
ENTRYPOINT ["/bin/rtd-start"]
CMD [""]

RUN cd /home/py/app && \
    /venv/bin/python manage.py syncdb --noinput' && \
    /venv/bin/python manage.py migrate && \
    /venv/bin/python manage.py loaddata test_data &&
    echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@localhost', 'admin')" | \
    /venv/bin/python manage.py shell

RUN chown -R py app

ADD config /
