# syntax=docker/dockerfile:1.4

# ----------- Build stage --------------------
ARG VERSION=dev
FROM quay.io/projectquay/golang:1.19 AS builder

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -o bot -ldflags "-X main.version=${VERSION}"

# ----------- Final image --------------------
FROM scratch

WORKDIR /app

# Копіюємо тільки необхідні файли
COPY --from=builder /app/bot .
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

ENTRYPOINT ["/app/bot"]

