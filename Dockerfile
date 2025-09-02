# Base: Mysterium Node oficial
FROM mysteriumnetwork/myst:latest

# Crear directorio de datos
RUN mkdir -p /var/lib/mysterium-node

# Exponer puerto que usa Mysterium Node
EXPOSE 4449

# Aceptar términos
ENV MYSTERIUM_AGREE_TERMS=true

# Configurar proxy HTTP/HTTPS (cambia usuario/contraseña)
ENV HTTP_PROXY="http://8c5906b99fbd1c0bcd0f916d545c565af84d0a15534d1e4fe9dde139cd27bd7588275d6f1b027e3fb033fb9f39a0435d167da5e532268f512f053455259db6b4:l1ytn5hikdqe@proxy.toolip.io:31111"
ENV HTTPS_PROXY="http://8c5906b99fbd1c0bcd0f916d545c565af84d0a15534d1e4fe9dde139cd27bd7588275d6f1b027e3fb033fb9f39a0435d167da5e532268f512f053455259db6b4:l1ytn5hikdqe@proxy.toolip.io:31111"
ENV NO_PROXY="localhost,127.0.0.1"

# Comando para arrancar Mysterium Node
CMD ["/usr/bin/mysterium-node", "--agreed-terms-and-conditions"]
