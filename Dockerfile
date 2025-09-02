# Base image
FROM ubuntu:22.04

# Cambiar al usuario root
USER root

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    curl \
    iptables \
    redsocks \
    sudo \
    systemd \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Crear directorios necesarios
RUN mkdir -p /var/lib/mysterium-node /etc/redsocks

# Copiar configuración de redsocks
COPY redsocks.conf /etc/redsocks/redsocks.conf

# Instalar Mysterium Node usando el script oficial
RUN bash -c "$(curl -s https://raw.githubusercontent.com/mysteriumnetwork/node/master/install.sh)"

# Exponer el puerto que Mysterium Node utiliza
EXPOSE 4449

# Variables de entorno
ENV MYSTERIUM_AGREE_TERMS=true

# Comando para iniciar redsocks y Mysterium Node
CMD redsocks -c /etc/redsocks/redsocks.conf & \
    systemctl start mysterium-node.service && \
    tail -f /var/log/mysterium-node/mysterium-node.log
