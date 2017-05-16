FROM ubuntu:14.04
MAINTAINER Manfred Touron "m@42.am"

ENV DEBIAN_FRONTEND noninteractive
ENV APPDIR /app
ENV DJANGO_SETTINGS_MODULE config
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV VIRTUAL_ENV /venv
ENV PATH /venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Set locale to UTF-8
RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
RUN locale-gen fr_FR.UTF-8
# Update python
RUN apt-get -qq update && \
    apt-get -y -qq upgrade && \
    apt-get install -y -qq \
        python libxml2-dev libxslt1-dev expat libevent-dev wget python-dev \
        texlive texlive-latex-extra language-pack-en unzip git python-pip \
        zlib1g-dev lib32z1-dev libpq-dev gettext curl && \
    apt-get clean

# Install test dependencies
RUN pip install -q \
    virtualenv \
    pep8 \
    mock \
    nose \
    coverage \
    pylint

# Setting up virtualenv
RUN virtualenv /venv

# Add user py
RUN adduser --gecos 'py' --disabled-password py

RUN mkdir -p $APPDIR && cd /tmp && \
    wget -q --no-check-certificate https://github.com/rtfd/readthedocs.org/archive/master.zip 

ADD config /

RUN /bin/rtd-install.sh

# Docker config
EXPOSE 8000
VOLUME ["/app"]
CMD ["/bin/rtd-start.sh"]
