
IMAGE_NAME = golang-debian

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .
