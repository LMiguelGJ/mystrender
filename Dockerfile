FROM ubuntu:22.04

USER root

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    gnupg \
    lsb-release \
    sudo \
    redsocks \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysterium-node /etc/redsocks
COPY redsocks.conf /etc/redsocks/redsocks.conf

ENV MYSTERIUM_AGREE_TERMS=true

# Descargar binario de Mysterium Node directamente
RUN curl -L -o /usr/bin/mysterium-node \
    https://github.com/mysteriumnetwork/node/releases/download/v0.29.3/mysterium-node-linux-amd64 \
    && chmod +x /usr/bin/mysterium-node

EXPOSE 4449

CMD redsocks -c /etc/redsocks/redsocks.conf & \
    /usr/bin/mysterium-node run
