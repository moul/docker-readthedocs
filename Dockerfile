FROM moul/python-dev
MAINTAINER Manfred Touron <m@42.am>

ENV DEBIAN_FRONTEND noninteractive
ENV DJANGO_SETTINGS_MODULE config
ENV APPDIR /app
EXPOSE 8000
ENTRYPOINT ["/bin/rtd-start.sh"]
CMD [""]

RUN apt-get -qqy update
RUN adduser --gecos 'py' --disabled-password py
RUN apt-get -qqy install \
    libxml2-dev libxslt1-dev expat libevent-dev wget \
    texlive texlive-latex-extra language-pack-en unzip

ADD https://github.com/rtfd/readthedocs.org/archive/master.tar.gz $APPDIR
ADD config /
RUN /bin/rtd-install.sh

