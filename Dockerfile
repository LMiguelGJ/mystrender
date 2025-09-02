# =========================================
# Dockerfile para Mysterium Node con proxy
# =========================================

# Imagen base
FROM ubuntu:22.04

# Cambiar al usuario root
USER root

# Configurar proxy (ajusta con tus credenciales)
ENV HTTP_PROXY=http://8c5906b99fbd1c0bcd0f916d545c565af84d0a15534d1e4fe9dde139cd27bd7588275d6f1b027e3fb033fb9f39a0435d167da5e532268f512f053455259db6b4:l1ytn5hikdqe@proxy.toolip.io:31111
ENV HTTPS_PROXY=http://8c5906b99fbd1c0bcd0f916d545c565af84d0a15534d1e4fe9dde139cd27bd7588275d6f1b027e3fb033fb9f39a0435d167da5e532268f512f053455259db6b4:l1ytn5hikdqe@proxy.toolip.io:31111

# Instalar dependencias necesarias de forma segura
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        gnupg \
        lsb-release \
        sudo \
        net-tools \
        iproute2 \
        iputils-ping \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Crear directorios necesarios para Mysterium Node
RUN mkdir -p /var/lib/mysterium-node /etc/mysterium

# Descargar e instalar Mysterium Node usando el script oficial
RUN curl -s https://raw.githubusercontent.com/mysteriumnetwork/node/master/install.sh | bash

# Variables de entorno para aceptar términos
ENV MYSTERIUM_AGREE_TERMS=true

# Exponer el puerto que Mysterium Node utiliza (puedes cambiarlo según necesidad)
EXPOSE 10000

# Comando para iniciar Mysterium Node
CMD ["/usr/bin/mysterium-node", "run", "--log-level", "info", "--port", "10000"]
