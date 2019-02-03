FROM alpine:3.9
MAINTAINER Slavik Svyrydiuk "slavik@svyrydiuk.eu"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" \
 	>> /etc/apk/repositories && \
    apk update --no-cache && \
    apk add \
        runit \
        tini \
        tor \
        3proxy
COPY etc /etc
COPY usr /usr
ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/services.d"]
