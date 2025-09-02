FROM mysteriumnetwork/myst:latest

RUN mkdir -p /var/lib/mysterium-node

EXPOSE 4449

ENV MYSTERIUM_AGREE_TERMS=true

CMD ["service", "--agreed-terms-and-conditions"]
