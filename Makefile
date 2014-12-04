build:
	docker build -t readthedocs .

release:
	docker tag readthedocs moul/readthedocs
	docker push moul/readthedocs

run:
	docker run -it --rm -p 8000:8000 --entrypoint=bash readthedocs

start:
	docker run -it --rm -p 8000:8000 readthedocs
