FROM golang:1.21-alpine

WORKDIR /app

RUN apk add git &&\
    git clone https://github.com/secengjeff/rapidresetclient.git src &&\
    cd src &&\
    go get golang.org/x/net/http2 &&\
    go get golang.org/x/net/http2/hpack &&\
    go build -o ../rapidresetclient
RUN ["rm", "-rf", "/var/cache/apk/*"]
ENV PATH=$PATH:/app

ENTRYPOINT [ "rapidresetclient" ]

