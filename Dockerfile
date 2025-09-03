FROM iproyal/pawns-cli:latest

CMD /bin/sh -c "/pawns-cli -email $PAWNS_EMAIL -password $PAWNS_PASSWORD -device-name $DEVICE_NAME -device-id $DEVICE_ID -accept-tos"
