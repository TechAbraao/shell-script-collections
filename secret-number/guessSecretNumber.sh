#!/bin/bash

secret_number=$(( RANDOM % 11 ))
count=2

echo "Seja bem-vindo ao Acerte o Número Secreto!"
while true
do
    echo "Você tem apenas $((count+1)) tentativas."
    read -p "Digite um número entre 0 até 10: " number
    if [ $number -eq $secret_number ]; then
        echo "Parabéns, você acertou o número secreto. =)"
        break
    elif [ $count -eq 0 ]; then
        echo "Errou todas as tentativas."
        break
    elif [ $number -lt $secret_number ]; then
        echo "O número secreto é um pouco maior."
        (( count-- ))
    elif [ $number -gt $secret_number ]; then
        echo "O número secreto é um pouco menor."
        (( count-- ))
    fi
done
