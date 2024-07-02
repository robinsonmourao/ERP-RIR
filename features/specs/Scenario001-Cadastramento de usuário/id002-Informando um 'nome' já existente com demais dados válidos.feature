# language: en

Feature: Cadastrar no sistema

-Eu como usuário.
-Quero verificar se o sistema me avisa quando eu já estiver cadastrado.
-Para evitar duplicidade de cadastros

Scenario: Validar se é permitido cadastro de usuário duplicados com dados válidos

    Given eu esteja na tela de cadastro
        And #CADASTRAMENTO_TO_CADASTRAMENTO_LENIENT_CONTEXT: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
    When preencha os campos pertinentes com MESMO nome "UsuarioSuper" cadastrado anteriormente, password "12345678" e permissao "Super"
        And clico no botão Cadastrar
    Then vejo que o nome "UsuarioSuper" já está em uso.