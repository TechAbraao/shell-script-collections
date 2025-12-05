#!/bin/bash

read -p "Digite o tempo em segundos: " timer

while (( timer > 0 ))
do
	echo "Restam apenas: $timer segundos."
    sleep 1
	((timer--))
done