# Desafio3-Bash

Desafio 3 - Bash

Serviço no linux que monitore um diretório e mova o arquivo instantaneamente para outro diretório quando este for armazenado neste diretório.
Garanta que o serviço esteja ativo de forma que suba durante o processo de inicialização do linux, caso este venha a ser reiniciado.

# Características

* Monitorar o diretório
* Mover para os arquivos de um diretório origem para um diretório destino

# Pré-requisitos

Ter o pacote inotify-tools instaldo no linux

# Como Usar

Opção 1: (Comando para criar a pasta e copiar o arquivo bash desafiobash.sh para /var/local/bin com permissões ao usuário ativo.)

sudo mkdir -p /var/local/bin (Caso não exista)
sudo cp ./desafiobash.sh /var/local/bin && sudo chmod 744 /var/local/bin/desafiobash.sh

Opção 2: (Copiar arquivo bash para o diretório system)

sudo cp desafiobash.service /etc/systemd/system

Opção 3: (Dando um start ao serviço)

sudo systemctl start desafiobash.service

Opção 4: (Com enable ao reiniciar a máquina o serviço volta ativo)

sudo systemctl enable desafiobash.service 

# Monitoramento

sudo journalctl -u desafiobash.service -f

# TESTE

Crie um arquivo dentro da pasta /tmp/origem e verá que este arquivo será removido para pasta /tmp/destino

Exemplo: touch teste.txt /tmp/origem
         ls -la /tmp/destino (Verá o arquivo criado aqui) 


