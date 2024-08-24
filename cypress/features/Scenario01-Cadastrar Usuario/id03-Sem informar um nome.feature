# language: pt

@skip
Feature: Cadastrar Usuário no sistema

-Eu como usuário.
-Quero me cadastrar no sistema sem informar nenhum nome.
-Para verificar que o sistema não permite o cadastro sem um nome

Scenario: Validar se é permitido cadastro sem informar nenhum um nome

    Given #0103: que eu esteja na tela de cadastro.
    When #0103: eu preencher os campos pertinentes com nome "", password "12345678" e permissao "Super"
        And #0103: eu clicar no botão cadastrar.
    Then #0103: eu vejo um alerta informando que o campo não pode ser vazio.