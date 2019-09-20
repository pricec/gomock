ARG BASE_IMAGE=golang:1.13.0-buster
ARG GOMOCK_VERSION=v1.3.1

FROM ${BASE_IMAGE} as builder

ARG GOMOCK_VERSION

ENV GO111MODULE=on

RUN go get github.com/golang/mock/gomock@${GOMOCK_VERSION} && \
    go install github.com/golang/mock/mockgen

FROM ${BASE_IMAGE}

COPY --from=builder /go/bin/mockgen /usr/local/bin

CMD []