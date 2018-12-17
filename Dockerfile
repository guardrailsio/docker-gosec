FROM golang:1.10.3-alpine3.8

# add tool user, install dependencies, and
# Install gosec
RUN addgroup -S tool && adduser -S -G tool tool && \
    apk add git build-base && \
    go get github.com/securego/gosec/cmd/gosec/...

ENV GOPATH /opt/mount

# change user
USER tool

ENTRYPOINT ["/go/bin/gosec", "-quiet", "/opt/mount/src/..."]