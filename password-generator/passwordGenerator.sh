#!/bin/bash
urandom=/dev/urandom

read -p "Digite a quantidade de caracteres que deseja na sua senha: " carac

if ! [[ "$carac" =~ ^[0-9]+$ ]]; then
	echo "Digite apenas números."
	exit 1
fi

password=$(tr -dc 'A-Za-z0-9!@#$%&*' < $urandom | head -c $carac)

echo "Senha com $carac caracteres: $password"




