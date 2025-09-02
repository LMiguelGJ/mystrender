FROM mysteriumnetwork/myst:latest

RUN mkdir -p /var/lib/mysterium-node

EXPOSE 4449

ENV MYSTERIUM_AGREE_TERMS=true
ENV HTTP_PROXY=http://8c5906b99fbd1c0bcd0f916d545c565a04a20d6b5658e433c66148c3b7a3d5827bcf0e27a961c195d6dda8ede85a94d29e416ccaa187736157a363e51d8df5f0login:nsyh2u476ewf@proxy.toolip.io:31111
ENV HTTPS_PROXY=http://8c5906b99fbd1c0bcd0f916d545c565a04a20d6b5658e433c66148c3b7a3d5827bcf0e27a961c195d6dda8ede85a94d29e416ccaa187736157a363e51d8df5f0login:nsyh2u476ewf@proxy.toolip.io:31111

CMD ["service", "--agreed-terms-and-conditions"]
