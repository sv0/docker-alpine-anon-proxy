FROM alpine:edge

RUN apk update --no-cache && \
    apk add \
        proxychains-ng \
        runit \
        tini \
        tinyproxy \
        tor

COPY etc /etc
ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/services.d"]
