REGISTRY ?= ghcr.io/merida39
IMAGE ?= telegram-bot
VERSION ?= dev

build:
	docker build -t $(REGISTRY)/$(IMAGE):$(VERSION) --build-arg VERSION=$(VERSION) .

push:
	docker push $(REGISTRY)/$(IMAGE):$(VERSION)

image: build push

run:
	docker run --rm -e TELE_TOKEN=$(TELE_TOKEN) $(REGISTRY)/$(IMAGE):$(VERSION)

clean:
	docker rmi $(REGISTRY)/$(IMAGE):$(VERSION) || true



