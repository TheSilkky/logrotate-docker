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

CMD ["/usr/sbin/logrotate", "--verbose", "--state", "/var/lib/logrotate/logrotate.status", "/etc/logrotate.conf"]

VOLUME ["/var/lib/logrotate"]

LABEL org.opencontainers.image.source="https://github.com/logrotate/logrotate.git"
LABEL org.opencontainers.image.licenses="GPL-2.0"
LABEL org.opencontainers.image.title="Logrotate"
LABEL org.opencontainers.image.description="The logrotate utility is designed to simplify the administration of log files on a system which generates a lot of log files."