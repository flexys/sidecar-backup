DUMMY: build
VERSION:=0.13
LOCALREG:=localhost:5000
REMOTEREG:=flexys
NAME:=sidecar-backup

docker-build:
	docker build -t $(NAME) $(ARGS) .

docker-tag:
	docker tag $(NAME) $(LOCALREG)/$(NAME):$(VERSION)

docker-remote-tag:
	docker tag $(NAME) $(REMOTEREG)/$(NAME):$(VERSION)

docker-push:
	docker push $(LOCALREG)/$(NAME)

docker-remote-push:
	docker push $(REMOTEREG)/$(NAME)

build: docker-build

tag: docker-build docker-tag

push: docker-build docker-tag docker-push

release: docker-build docker-remote-tag docker-remote-push
