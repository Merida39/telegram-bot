VERSION ?= dev
IMAGE := ghcr.io/merida39/telegram-bot:$(VERSION)-linux-amd64

build:
	docker build -t $(IMAGE):$(VERSION) --build-arg VERSION=$(VERSION) .

image: build

run:
	docker run --rm -e TELE_TOKEN=$(TELE_TOKEN) $(IMAGE):$(VERSION)

clean:
	docker rmi $(IMAGE):$(VERSION) || true

helm-update:
	sed -i "s|tag:.*|tag: \"$(VERSION)\"|" helm/telegram-bot/values.yaml

commit-helm:
	git add helm/telegram-bot/values.yaml
	git commit -m "Update Helm tag to $(VERSION)"
	git push

deploy: build push helm-update commit-helm
