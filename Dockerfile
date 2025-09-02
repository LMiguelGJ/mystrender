FROM mysteriumnetwork/myst:latest

USER root
RUN mkdir -p /var/lib/mysterium-node && chown -R node:node /var/lib/mysterium-node
USER node

EXPOSE 4449

ENV MYSTERIUM_AGREE_TERMS=true

CMD ["service", "--agreed-terms-and-conditions"]
