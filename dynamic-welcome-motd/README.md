### MOTD (Message of the Day) dinâmico

 - O diretório `/etc/update-motd.d/` contém scripts que são executados automaticamente sempre que um usuário faz login no sistema. Isso permite criar mensagens dinâmicas e personalizadas — como, por exemplo, uma saudação de boas-vindas para quem se conectar via SSH.

- Após adicionar o script no diretório correto, dê permissão de execução com `sudo chmod +x /etc/update-motd.d/<script_personalizado>`.

### Principais problemas

- Para testar seu script manualmente, basta utilizar o seguinte comando: `run-parts run-parts /etc/update-motd.d`.

- O arquivo salvo em `/etc/update-motd.d/` não ter .sh no final e, além disso, quando um arquivo não começa com números, o `run-parts` não executa automaticamente no SSH.

- Na distribuição Pop!_OS, o parâmetro `PrintMotd no` vem desativado por default, ou seja, o OpenSSH não mostra a MOTD. Para corrigir, basta:

``bash
# 1. Execute 
$ sudo grep PrintMotd /etc/ssh/sshd_config

# 2. Provavelmente vai aparecer
$ PrintMotd no

# 3. Edite e altere para 'yes'
$ sudo nano /etc/ssh/sshd_config
$ PrintMotd yes

# Agora reinicie o serviço SSH
$ sudo systemctl restart sshd
``
