FROM mysteriumnetwork/myst:latest

# Crear usuario 'node'
RUN useradd -ms /bin/bash node

RUN mkdir -p /var/lib/mysterium-node && chown -R node:node /var/lib/mysterium-node

USER node

EXPOSE 4449

ENV MYSTERIUM_AGREE_TERMS=true

CMD ["service", "--agreed-terms-and-conditions"]
