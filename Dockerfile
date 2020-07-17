ARG ALPINE_VERSION=3.12.0

FROM alpine:$ALPINE_VERSION

MAINTAINER ops@newsletter2go.com

ARG POSTFIX_VERSION=3.5.2-r1

RUN apk add --no-cache --update \
    postfix=$POSTFIX_VERSION \
    ca-certificates

COPY .docker/ /
RUN chmod -R 644 /etc/postfix

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["postfix", "start"]
