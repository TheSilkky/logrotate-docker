ARG ALPINE_VERSION=3.18

####################################################################################################
## Final image
####################################################################################################
FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache \
    ca-certificates \
    tzdata \
    bash \
    logrotate \
    docker-cli

COPY --chmod=755 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/logrotate", "--verbose", "/etc/logrotate.conf"]

LABEL org.opencontainers.image.source="https://github.com/traefik/traefik.git"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="Traefik"
LABEL org.opencontainers.image.description="A modern reverse-proxy"
LABEL org.opencontainers.image.version="v${TRAEFIK_VERSION}"