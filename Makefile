NAME =	moul/readthedocs

build:
	docker build -t $(NAME) .

release:
	docker push $(NAME)

run:
	docker run -it --rm -p 8000:8000 --entrypoint=bash $(NAME)

start:
	docker run -it --rm -p 8000:8000 $(NAME)
