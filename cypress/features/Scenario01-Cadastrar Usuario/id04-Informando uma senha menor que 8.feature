# language: pt

@skip
Feature: Cadastrar Usuário no sistema

-Eu como usuário.
-Quero me cadastrar no sistema informando uma senha menor que 8
-Para verificar que o sistema não permite o cadastro com senhas menor que 8

Scenario: Validar se é permitido cadastro informando uma senha menor que 8

    Given #0104: que eu esteja na tela de cadastro.
    When #0104: eu preencher os campos pertinentes com nome "UsuarioSuper", password "1234567" e permissao "Super"
        And #0104: eu clicar no botão cadastrar.
    Then #0104: eu vejo um alerta informando que a senha informada possui o tamanho inadequado.