#!/bin/bash

echo "Bem vindo ao script de consultas DNS"
echo "Digite o domínio a ser consultada. Exemplo: businesscorp.com.br"
read dominio

echo "Escolha a opção desejada:"

echo "1: Conultar as principais informações - WHOIS"

echo "2: Realizar uma consulta direta - DNS"

echo "3: Realizar uma verificação de CNAMEs"

read numero

case $numero in

        1)
                whois $dominio ;;

        2)
                for palavra in $(cat lista.txt);
                do host $palavra.$dominio | grep -v "NXDOMAIN";
                done;;
        3)
                for palavra in $(cat lista.txt);
                do host -t cname $palavra.$dominio | grep  "alias for"
                done;;

esac

