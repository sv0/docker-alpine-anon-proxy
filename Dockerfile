FROM alpine:edge
MAINTAINER Slavik Svyrydiuk "slavik@svyrydiuk.eu"

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing \
		>> /etc/apk/repositories && \
	apk update --no-cache && \
    apk add \
        3proxy \
        runit \
        tini \
        tor

COPY etc /etc
ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/services.d"]
