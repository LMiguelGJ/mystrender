#!/bin/bash
set -e

# Crear directorio de configuración si no existe
mkdir -p /root/.mysterium

# Generar identidad si no existe
CONFIG_FILE="/root/.mysterium/config-mainnet.toml"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Generando identidad de Mysterium Node..."
    /usr/local/bin/mysterium-node identity generate --output "$CONFIG_FILE"
fi

# Iniciar Redsocks
echo "Iniciando Redsocks..."
redsocks -c /etc/redsocks/redsocks.conf &

# Iniciar Mysterium Node con términos aceptados
echo "Iniciando Mysterium Node..."
exec /usr/local/bin/mysterium-node service --agreed-terms-and-conditions
