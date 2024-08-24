# language: pt

@skip
Feature: Cadastrar Usuário no sistema

-Eu como usuário.
-Quero me cadastrar no sistema informando uma senha maior que 8
-Para verificar que o sistema não permite o cadastro com senhas maior que 12

Scenario: Validar se é permitido cadastro informando uma senha maior que 12

    Given #0105: que eu esteja na tela de cadastro.
    When #0105: eu preencher os campos pertinentes com nome "UsuarioSuper", password "1234567890123" e permissao "Super"
        And #0105: eu clicar no botão cadastrar.
    Then #0105: eu vejo um alerta informando que a senha informada possui o tamanho inadequado.