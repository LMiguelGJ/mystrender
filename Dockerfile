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
    tar \
    && rm -rf /var/lib/apt/lists/*

# Crear directorios
RUN mkdir -p /var/lib/mysterium-node /etc/redsocks /usr/local/bin

# Copiar configuración de Redsocks
COPY redsocks.conf /etc/redsocks/redsocks.conf

# Descargar y extraer binario de Mysterium Node
RUN curl -fSL -o /tmp/myst_linux_amd64.tar.gz \
    https://github.com/mysteriumnetwork/node/releases/download/1.35.4/myst_linux_amd64.tar.gz \
    && tar -xzf /tmp/myst_linux_amd64.tar.gz -C /tmp \
    && mv /tmp/myst /usr/local/bin/mysterium-node \
    && chmod +x /usr/local/bin/mysterium-node \
    && rm -rf /tmp/myst_linux_amd64.tar.gz

# Exponer puerto que usa Mysterium Node
EXPOSE 4449

# Variables de entorno
ENV MYSTERIUM_AGREE_TERMS=true

CMD redsocks -c /etc/redsocks/redsocks.conf & \
    /usr/local/bin/mysterium-node --log /var/lib/mysterium-node/mysterium-node.log
