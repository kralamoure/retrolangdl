FROM golang:1.16.3-buster AS builder

WORKDIR /app
COPY . .

RUN go install -v ./...

FROM ubuntu:20.04

LABEL org.opencontainers.image.source="https://github.com/kralamoure/d1langdl"

RUN apt update && apt upgrade -y

WORKDIR /app
COPY --from=builder /go/bin/ .

ENTRYPOINT ["./d1langdl"]