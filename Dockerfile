FROM iproyal/pawns-cli:latest

# Copiar el script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# CMD que Render ejecutará
CMD ["/start.sh"]
