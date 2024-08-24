# language: pt

@skip
@apagar_usuario_ao_terminar
Feature: Cadastrar Usuário no sistema

-Eu como usuário.
-Quero me cadastrar no sistema solicitando permissão 'Administrativo'
-Para verificar que o sistema permite solicitar permissão 'Administrativo'

Scenario: Validar se é permitido cadastro solicitando permissão 'Administrativo'

    Given #0108: que eu esteja na tela de cadastro.
    When #0108: eu preencher os campos pertinentes com nome "UsuarioAdministrativo", password "12345678" e permissao "Administrativo"
        And #0108: eu clicar no botão cadastrar.
    Then #0108: eu vejo uma mensagem de boas vindas com nome "UsuarioAdministrativo"