FROM alpine:latest

LABEL maintainer="Maikel Mertens"

WORKDIR /app
COPY ./app/assume-role /app/assume-role

RUN apk update && \
    apk add ca-certificates && \
    pip3 install awscli && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/app/assume-role"]
