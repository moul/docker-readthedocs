# Readthedocs in Docker

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

    make run
    # or
    docker run -it --rm --entrypoint=bash moul/readthedocs

## License

MIT
