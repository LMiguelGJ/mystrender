FROM mysteriumnetwork/myst:latest

RUN apt-get update && apt-get install -y redsocks iptables

RUN mkdir -p /var/lib/mysterium-node /etc/redsocks

COPY redsocks.conf /etc/redsocks/redsocks.conf

EXPOSE 4449

ENV MYSTERIUM_AGREE_TERMS=true

CMD redsocks -c /etc/redsocks/redsocks.conf & \
    service --agreed-terms-and-conditions
