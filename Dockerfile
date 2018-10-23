FROM golang:alpine

ENV GOPATH="$HOME/go"

RUN apk add curl

RUN apk add git

RUN curl https://glide.sh/get | sh

COPY . $GOPATH/src/hello

WORKDIR $GOPATH/src/hello

RUN glide install

RUN go build

ENTRYPOINT ./hello