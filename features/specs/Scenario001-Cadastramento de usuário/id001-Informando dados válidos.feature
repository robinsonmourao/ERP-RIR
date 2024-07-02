# language: en

Feature: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema.
-Para poder acessar as funcionalidades do sistema.

Scenario: Validar se é permitido cadastro de usuário com dados válidos

    Given que eu esteja na tela de cadastro.
    When preencha os campos pertinentes com nome "UsuarioSuper", password "12345678" e permissao "Super"
        And clico no botão cadastrar.
    Then sou redirecionado para dashboard
        And #MESSAGE_TO_LOGIN_LENIENT_CONTEXT: vejo uma mensagem de boas vindas com nome "UsuarioSuper"