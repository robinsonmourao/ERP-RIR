# language: pt

@skip
@apagar_usuario_ao_terminar
Feature: Cadastrar Usuário no sistema

-Eu como usuário.
-Quero me cadastrar no sistema solicitando permissão 'Consulta'
-Para verificar que o sistema permite solicitar permissão 'Consulta'

Scenario: Validar se é permitido cadastro solicitando permissão 'Consulta'

    Given #0110: que eu esteja na tela de cadastro.
    When #0110: eu preencher os campos pertinentes com nome "UsuarioConsulta", password "12345678" e permissao "Consulta"
        And #0110: eu clicar no botão cadastrar.
    Then #0110: eu vejo uma mensagem de boas vindas com nome "UsuarioConsulta"