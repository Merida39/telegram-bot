# syntax=docker/dockerfile:1.4

ARG VERSION=dev

FROM quay.io/projectquay/golang:1.19 AS builder

WORKDIR /go/src/app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -v -o /out/bot -ldflags "-X main.version=${VERSION}"

FROM scratch

WORKDIR /app
COPY --from=builder /out/bot .

COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

ENTRYPOINT ["/app/bot"]


