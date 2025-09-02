# Base image
FROM ubuntu:22.04

USER root

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    gnupg \
    lsb-release \
    sudo \
    redsocks \
    iproute2 \
    iptables \
    iputils-ping \
    tar \
    && rm -rf /var/lib/apt/lists/*

# Crear directorios necesarios
RUN mkdir -p /var/lib/mysterium-node /etc/redsocks /usr/local/bin

# Copiar configuración de Redsocks
COPY redsocks.conf /etc/redsocks/redsocks.conf

# Instalar Mysterium Node
RUN curl -fSL -o /tmp/myst_linux_amd64.tar.gz \
    https://github.com/mysteriumnetwork/node/releases/download/1.35.4/myst_linux_amd64.tar.gz \
    && tar -xzf /tmp/myst_linux_amd64.tar.gz -C /tmp \
    && mv /tmp/myst /usr/local/bin/mysterium-node \
    && chmod +x /usr/local/bin/mysterium-node \
    && rm -rf /tmp/myst_linux_amd64.tar.gz

# Exponer puerto del nodo
EXPOSE 4449

# Variables de entorno
ENV MYSTERIUM_AGREE_TERMS=true

# CMD definitivo: Redsocks + iptables + Mysterium Node
CMD redsocks -c /etc/redsocks/redsocks.conf & \
    iptables -t nat -A OUTPUT -p tcp --dport 4449 -j REDIRECT --to-ports 12345 && \
    /usr/local/bin/mysterium-node service --agreed-terms-and-conditions
