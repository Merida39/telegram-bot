REGISTRY ?= ghcr.io/merida39
IMAGE ?= telegram-bot
VERSION ?= dev
ARCH ?= linux-amd64

build:
	docker build -t $(REGISTRY)/$(IMAGE):$(VERSION)-$(ARCH) --build-arg VERSION=$(VERSION) .

push:
	docker push $(REGISTRY)/$(IMAGE):$(VERSION)-$(ARCH)

image: build push

run:
	docker run --rm -e TELE_TOKEN=$(TELE_TOKEN) $(REGISTRY)/$(IMAGE):$(VERSION)-$(ARCH)

clean:
	docker rmi $(REGISTRY)/$(IMAGE):$(VERSION)-$(ARCH) || true




