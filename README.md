Readthedocs in Docker
=====================

A Docker container of Readthedocs (RTD).

Usage
-----

Run as a daemon :

    docker run -d -p 8000:8000 moul/readthedocs

Run in foreground :

    docker run -it -p 8000:8000 moul/readthedocs

Run in debug mode (bash) :

    make run
    # or
    docker run -it --rm --entrypoint=bash moul/readthedocs
    
Build the container from sources :

    docker build -t moul/readthedocs .
    # or
    make build
