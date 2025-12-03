### MOTD dinâmico

 - O diretório `/etc/update-motd.d/` contém scripts que são executados automaticamente sempre que um usuário faz login no sistema. Isso permite criar mensagens dinâmicas e personalizadas — como, por exemplo, uma saudação de boas-vindas para quem se conectar via SSH.

- Após adicionar o script no diretório correto, dê permissão de execução com `sudo chmod +x /etc/update-motd.d/<script_personalizado>`