.PHONY: secret-number

secret-number:
	@echo "Iniciando o Secret Number!!!"
	sleep 2
	clear
	sudo chmod +x ./secret-number/guessSecretNumber.sh
	./secret-number/guessSecretNumber.sh
	