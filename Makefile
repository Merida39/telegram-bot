VERSION := $(shell git describe --tags --always)
IMAGE := ghcr.io/merida39/telegram-bot:$(VERSION)-linux-amd64

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

helm-update:
	sed -i "s|tag:.*|tag: \"$(VERSION)-linux-amd64\"|" helm/telegram-bot/values.yaml

deploy: helm-update
	git add helm/telegram-bot/values.yaml
	git commit -m "Update helm chart version to $(VERSION)-linux-amd64" || echo "No changes"
	git push origin develop
