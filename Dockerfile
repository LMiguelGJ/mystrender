# Base image
FROM docker:latest

# Variables de entorno
ENV EARNFM_TOKEN="b14ab038-364f-4082-a7e4-a5b3e992fbf3"

# Instalar dependencias necesarias
RUN apk add --no-cache bash curl sudo

# Ejecutar EarnFM y Watchtower
CMD sh -c "\
    docker stop watchtower || true && \
    docker rm watchtower || true && \
    docker rmi containrrr/watchtower || true && \
    docker stop earnfm-client || true && \
    docker rm earnfm-client || true && \
    docker rmi earnfm/earnfm-client:latest || true && \
    docker run -d --restart=always -e EARNFM_TOKEN=$EARNFM_TOKEN --name earnfm-client earnfm/earnfm-client:latest && \
    docker run -d --restart=always --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --cleanup --include-stopped --include-restarting --revive-stopped --interval 60 earnfm-client \
"
