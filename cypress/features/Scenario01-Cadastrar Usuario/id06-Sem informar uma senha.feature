# language: pt

@skip
Feature: Cadastrar Usuário no sistema

-Eu como usuário.
-Quero me cadastrar no sistema sem informar nenhuma senha.
-Para verificar que o sistema não permite o cadastro sem uma senha

Scenario: Validar se é permitido cadastro sem informar nenhuma senha

    Given #0106: que eu esteja na tela de cadastro.
    When #0106: eu preencher os campos pertinentes com nome "UsuarioSuper", password "" e permissao "Super"
        And #0106: eu clicar no botão cadastrar.
    Then #0106: eu vejo um alerta informando que o campo não pode ser vazio