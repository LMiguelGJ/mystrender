#!/bin/bash
set -e

# Crear directorio de configuración si no existe
mkdir -p /root/.mysterium

# Iniciar Redsocks
echo "Iniciando Redsocks..."
redsocks -c /etc/redsocks/redsocks.conf &

# Iniciar Mysterium Node con términos aceptados
echo "Iniciando Mysterium Node..."
exec /usr/local/bin/mysterium-node service --agreed-terms-and-conditions

