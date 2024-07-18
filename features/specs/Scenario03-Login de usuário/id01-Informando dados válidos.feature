# language: pt
@skip
Funcionalidade: Entrar no sistema

-Eu como usuário.
-Quero acessar o sistema.
-Para acessar as funcionalidades do sistema.

Cenário: Validar se login funciona com dados válidos

    Dado #0301: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E eu esteja na tela de entrar
    Quando eu preencher os campos pertinentes com MESMO nome "UsuarioSuper" e password "12345678" cadastrados anteriormente
        E eu clicar no botão Entrar    
    Então eu sou redirecionado para dashboard.
        E #0301: eu vejo uma mensagem de boas vindas com nome "UsuarioSuper"