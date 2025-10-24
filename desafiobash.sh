#!/bin/bash

# Diretório a ser monitorado
DIR_ORIGEM="/tmp/origem"
# Diretório de destino
DIR_DESTINO="/tmp/destino"

# Verificar se inotify-tools está instalado
if ! command -v inotifywait; then
    echo "Erro: inotify-tools não está instalado."
    echo "Instale com: sudo apt-get install inotify-tools"
    exit 1
fi

# Criar diretório de origem se não existir
mkdir -p "$DIR_ORIGEM"
chmod 777 "$DIR_ORIGEM"

# Criar diretório de destino se não existir
mkdir -p "$DIR_DESTINO"

# Monitorar o diretório
echo "Monitorando $DIR_ORIGEM..."
inotifywait -m -e close_write --format "%f" "$DIR_ORIGEM" |
while read arquivo
do
    echo "Movendo arquivo: $arquivo"
    mv "$DIR_ORIGEM/$arquivo" "$DIR_DESTINO/"
    echo "Arquivo $arquivo movido para $DIR_DESTINO"
done