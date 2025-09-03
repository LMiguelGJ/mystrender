# Dockerfile para Render
FROM iproyal/pawns-cli:latest

# Opcional: establecer variables de entorno para email/password
ENV EMAIL=l.miguel.gonzalez.j@gmail.com
ENV PASSWORD=l.miguel.gonzalez.j
ENV DEVICE_NAME=raspberrypi
ENV DEVICE_ID=raspberrypi1

# Comando por defecto al iniciar el contenedor
CMD ["pawns-cli", "-email=${EMAIL}", "-password=${PASSWORD}", "-device-name=${DEVICE_NAME}", "-device-id=${DEVICE_ID}", "-accept-tos"]
