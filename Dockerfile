# Base image
FROM ubuntu:22.04

# Cambiar al usuario root
USER root

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    gnupg \
    lsb-release \
    sudo \
    redsocks \
    iproute2 \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Crear directorios
RUN mkdir -p /var/lib/mysterium-node /etc/redsocks /usr/local/bin

# Copiar configuración de Redsocks
COPY redsocks.conf /etc/redsocks/redsocks.conf

# Descargar el binario de Mysterium Node (tarball amd64)
RUN curl -fSL -o /usr/local/bin/mysterium-node \
    https://github.com/mysteriumnetwork/node/releases/download/1.35.4/myst_linux_amd64.tar.gz \
    && tar -xzf /usr/local/bin/mysterium-node -C /usr/local/bin \
    && chmod +x /usr/local/bin/mysterium-node

# Exponer puerto que usa Mysterium Node
EXPOSE 4449

# Variables de entorno
ENV MYSTERIUM_AGREE_TERMS=true

# Comando de inicio
CMD redsocks -c /etc/redsocks/redsocks.conf & \
    /usr/local/bin/mysterium-node --accept-terms --log /var/lib/mysterium-node/mysterium-node.log
