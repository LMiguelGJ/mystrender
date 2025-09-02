#!/bin/bash
set -e

echo "Iniciando Redsocks..."
redsocks -c /etc/redsocks/redsocks.conf &

echo "Iniciando Mysterium Node..."
exec /usr/local/bin/mysterium-node service --agreed-terms-and-conditions
