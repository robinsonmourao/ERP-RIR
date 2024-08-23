# language: pt

@skip
@apagar_usuario_ao_terminar
Feature: Cadastrar Usuário no sistema

-Eu como usuário.
-Quero verificar se o sistema me avisa quando eu já estiver cadastrado.
-Para evitar duplicidade de cadastros

Scenario: Validar se é permitido cadastro de usuário duplicados com dados válidos

    Given que eu esteja na tela de cadastro
        And And eu já tenha realizado meu cadastro previamente.
    When eu acessar novamente a tela de cadastro
        And eu preencher os campos pertinentes com MESMO nome "UsuarioSuper" cadastrado anteriormente, password "12345678" e permissao "Super"
        And eu clicar no botão Cadastrar.
    Then eu vejo que o nome "UsuarioSuper" já está em uso.