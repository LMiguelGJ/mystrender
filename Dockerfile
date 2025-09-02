# Base oficial de Mysterium Node
FROM mysteriumnetwork/myst:latest

# Crear directorios necesarios
RUN mkdir -p /var/lib/mysterium-node /etc/redsocks

# Copiar configuración de redsocks si quieres usar proxy
COPY redsocks.conf /etc/redsocks/redsocks.conf

# Exponer el puerto que Mysterium Node usa
EXPOSE 4449

# Aceptar términos automáticamente
ENV MYSTERIUM_AGREE_TERMS=true

# Comando para arrancar redsocks (proxy) y Mysterium Node directamente
CMD redsocks -c /etc/redsocks/redsocks.conf & \
    /usr/bin/mysterium-node --agreed-terms-and-conditions
