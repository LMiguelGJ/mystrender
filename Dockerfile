FROM ubuntu:22.04

# Evitar preguntas interactivas durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    curl \
    iptables \
    redsocks \
    gnupg \
    lsb-release \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Instalar Mysterium Node desde repositorio oficial
RUN curl -s https://packagecloud.io/install/repositories/mysteriumnetwork/mysteriumnode/script.deb.sh | bash \
    && apt-get update \
    && apt-get install -y mysterium-node \
    && rm -rf /var/lib/apt/lists/*

# Crear directorios necesarios
RUN mkdir -p /var/lib/mysterium-node /etc/redsocks

# Copiar configuración de redsocks
COPY redsocks.conf /etc/redsocks/redsocks.conf

# Exponer puerto de Mysterium Node
EXPOSE 4449

# Aceptar términos de Mysterium
ENV MYSTERIUM_AGREE_TERMS=true

# Comando principal: iniciar redsocks y Mysterium Node
CMD redsocks -c /etc/redsocks/redsocks.conf & \
    mysterium-node service run
