FROM earnfm/earnfm-client:latest

# Configura la variable de entorno
ENV EARNFM_TOKEN=b14ab038-364f-4082-a7e4-a5b3e992fbf3

# Render necesita un comando CMD, pero la imagen ya lo trae
# Si quieres, lo puedes forzar explícitamente:
CMD ["/app/earnfm-client"]
