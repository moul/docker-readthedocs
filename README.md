# Readthedocs in Docker

[![GuardRails badge](https://badges.production.guardrails.io/moul/docker-readthedocs.svg)](https://www.guardrails.io)

A Docker container of Readthedocs (RTD).

## Usage

Run using docker-compose:

* start a readthedocs container + its dependencies (postgresql, elasticsearch and redis)

```console
$ docker-compose run --service-ports --rm readthedocs
# or
$ make run
```

---

Run in debug mode (bash) :

    make debug-run
    # or
    docker run -it --rm --entrypoint=bash moul/readthedocs

## License

MIT
