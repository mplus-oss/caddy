ARG CADDY_VERSION
FROM caddy:${CADDY_VERSION}-builder AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddyserver/transform-encoder

FROM caddy:${CADDY_VERSION}
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
