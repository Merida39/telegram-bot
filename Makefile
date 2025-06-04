VERSION ?= dev
IMAGE ?= telegram-bot

build:
	docker build -t $(IMAGE):$(VERSION) --build-arg VERSION=$(VERSION) .

run:
	docker run --rm -e TELE_TOKEN=$(TELE_TOKEN) $(IMAGE):$(VERSION)

clean:
	docker rmi $(IMAGE):$(VERSION) || true

