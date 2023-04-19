ARG CADDY_VERSION
FROM caddy:${CADDY_VERSION}-builder AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddyserver/transform-encoder

FROM caddy:${CADDY_VERSION}
LABEL org.opencontainers.image.authors="Syahrial Agni Prasetya <syahrial@mplus.software>"
LABEL org.opencontainers.image.licenses="Apache-2.0"
LABEL org.opencontainers.image.vendor="M+ Software"
LABEL org.opencontainers.image.title="Caddy"
LABEL org.opencontainers.image.description="Customized build of Caddy web server"
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
