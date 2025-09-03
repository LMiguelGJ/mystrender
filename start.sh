#!/bin/bash
set -e

# Ejecutar pawns-cli con las variables de entorno
/pawns-cli \
  -email="$EMAIL" \
  -password="$PASSWORD" \
  -device-name="$DEVICE_NAME" \
  -device-id="$DEVICE_ID" \
  -accept-tos
