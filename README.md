# Desafio3-Bash

Serviço no linux que monitore um diretório origem e mova o arquivo instantaneamente para outro diretório destino quando qualquer arquivo for criado no diretório origem.
Garanta que o serviço esteja ativo de forma que suba durante o processo de inicialização do linux, caso este venha a ser reiniciado.

## Características

* Monitorar o diretório.
* Mover para os arquivos de um diretório origem para um diretório destino.

## Pré-requisitos

Ter o pacote inotify-tools instaldo no linux.

## Como Usar

*Opção 1:*
( Crie a pasta e copie o arquivo bash desafiobash.sh para /var/local/bin com suas devidas permissões ao usuário ativo )

```bash
sudo mkdir -p /var/local/bin
```

```bash
sudo cp ./desafiobash.sh /var/local/bin && sudo chmod 744 /var/local/bin/desafiobash.sh
```

*Opção 2:*
( Copie arquivo bash para o diretório system )

```bash
sudo cp desafiobash.service /etc/systemd/system
```

*Opção 3:*
( Inicie o serviço )

```bash
sudo systemctl start desafiobash.service
```

*Opção 4:*
( Comando para manter o serviço ativos caso o sistema operacional seja reiniciado )

```bash
sudo systemctl enable desafiobash.service 
```

## Monitoramento

```bash
sudo journalctl -u desafiobash.service -f
```

## Teste

Crie um arquivo dentro da pasta /tmp/origem e verá que este arquivo será removido para pasta /tmp/destino

*Exemplo:*

```bash
touch teste.txt /tmp/origem
```


