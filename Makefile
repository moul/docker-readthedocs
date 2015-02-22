NAME =	moul/readthedocs

build:
	docker build -t $(NAME) .

release:
	docker push $(NAME)

run:
	docker-compose run --service-ports --rm readthedocs
