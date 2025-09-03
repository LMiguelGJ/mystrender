FROM iproyal/pawns-cli:latest

CMD ["/pawns-cli",
     "-email", "l.miguel.gonzalez.j@gmail.com",
     "-password", "l.miguel.gonzalez.j",
     "-device-name", "raspberrypi",
     "-device-id", "raspberrypi1",
     "-accept-tos"]
