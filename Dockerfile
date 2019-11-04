ARG BASE_IMAGE=golang:1.13.4-buster
ARG GOMOCK_VERSION=v1.3.1

FROM ${BASE_IMAGE}

ARG GOMOCK_VERSION

ENV GO111MODULE=on

RUN git clone -b ${GOMOCK_VERSION} --depth 1 https://github.com/golang/mock /go/src/github.com/golang/mock && \
    go install github.com/golang/mock/mockgen && \
    ln -s /go/bin/mockgen /usr/local/bin/mockgen

CMD []
