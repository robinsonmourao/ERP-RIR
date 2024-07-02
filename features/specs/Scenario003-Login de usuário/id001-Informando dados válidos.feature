# language: en

Feature: Entrar no sistema

-Eu como usuário.
-Quero acessar o sistema.
-Para acessar as funcionalidades do sistema.

Scenario: Validar se login funciona com dados válidos

    Given #CADASTRAMENTO_TO_LOGIN_LENIENT_CONTEXT: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        And eu esteja na tela de entrar
    When preencha os campos pertinentes com MESMO nome "UsuarioSuper" e password "12345678" cadastrados anteriormente
        And clico no botão Entrar    
    Then sou redirecionado para dashboard.
        And #MESSAGE_TO_LOGIN_LENIENT_CONTEXT: vejo uma mensagem de boas vindas com nome "UsuarioSuper"