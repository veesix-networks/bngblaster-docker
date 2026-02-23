FROM debian:bookworm-slim

ARG BNGBLASTER_VERSION=0.9.30

LABEL org.opencontainers.image.title="BNG Blaster"
LABEL org.opencontainers.image.description="Unofficial Docker image for RTBrick BNG Blaster - an open-source network tester for routing and access protocols."
LABEL org.opencontainers.image.source="https://github.com/rtbrick/bngblaster"
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.author="Brandon Spendlove"

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    iproute2 \
    iputils-ping \
    && curl -fsSL -o /tmp/bngblaster.deb \
        "https://github.com/rtbrick/bngblaster/releases/download/${BNGBLASTER_VERSION}/bngblaster-${BNGBLASTER_VERSION}-bookworm_amd64.deb" \
    && apt-get install -y --no-install-recommends /tmp/bngblaster.deb \
    && rm -f /tmp/bngblaster.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY LICENSE-bngblaster /LICENSE

RUN bngblaster -v

WORKDIR /config

CMD ["sleep", "infinity"]
