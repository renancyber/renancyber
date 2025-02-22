#!/bin/bash
echo -e "\033[1;34m TraceHunter-Forensic-Collector \033[0m"
#verifica se o script está rodando como root
if [[ $EUID -ne 0 ]]; then
        echo -e "\033[1;31m Este script precisa ser executado como root.\033[0m"
        exit 1

fi

#Criando diretório para arquivos coletados
COLLECTED_DIR="collected_files"
mkdir -p "$COLLECTED_DIR"

#Exibir mensagem "Coletando arquivos do sistema..."
echo -e "\033[1;35m Coletando arquivos do sistema...\033[0m"

#Exibir mensagem "Listando informações sobre discos e partições..."
echo -e "\033[1;95m Listando informações sobre discos e partições...\033[0m"
lsblk > $COLLECTED_DIR/disk_info.txt

#Coleta de Conexões de Rede
echo -e "\033[1;95m Coletando informações de rede...\033[0m"
ss -tunap >  $COLLECTED_DIR/active_connections.txt
