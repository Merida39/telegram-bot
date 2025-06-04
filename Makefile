APP ?= $(shell basename $(shell git remote get-url origin))
REGISTRY ?= quay.io/gkosh
VERSION ?= $(shell git describe --tags --always --abbrev=0)-$(shell git rev-parse --short HEAD)
IMAGE_TAG ?= $(REGISTRY)/$(APP):$(VERSION)-$(TARGETOS)-$(TARGETARCH)
BUILDER ?= multiarch-builder

TARGETOS ?= linux
TARGETARCH ?= amd64

.PHONY: deps format lint test build image push clean \
        linux arm macos macos-arm windows windows-arm

deps:
	go mod download

format:
	gofmt -s -w ./

lint:
	golint ./...

test:
	go test -v ./...

build:
	CGO_ENABLED=0 GOOS=$(TARGETOS) GOARCH=$(TARGETARCH) \
		go build -v -o app -ldflags "-X main.version=$(VERSION)"

linux:
	$(MAKE) build TARGETOS=linux TARGETARCH=amd64

arm:
	$(MAKE) build TARGETOS=linux TARGETARCH=arm64

macos:
	$(MAKE) build TARGETOS=darwin TARGETARCH=amd64

macos-arm:
	$(MAKE) build TARGETOS=darwin TARGETARCH=arm64

windows:
	$(MAKE) build TARGETOS=windows TARGETARCH=amd64

windows-arm:
	$(MAKE) build TARGETOS=windows TARGETARCH=arm64

image:
	docker buildx create --use --name $(BUILDER) || true
	docker buildx build --platform=$(TARGETOS)/$(TARGETARCH) \
		-t $(IMAGE_TAG) --load .

push:
	docker push $(IMAGE_TAG)

clean:
	rm -rf app
	docker rmi $(IMAGE_TAG) || true
