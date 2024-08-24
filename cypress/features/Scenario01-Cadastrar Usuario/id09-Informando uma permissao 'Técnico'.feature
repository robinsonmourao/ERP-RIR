# language: pt

@skip
@apagar_usuario_ao_terminar
Feature: Cadastrar Usuário no sistema

-Eu como usuário.
-Quero me cadastrar no sistema solicitando permissão 'Tecnico'
-Para verificar que o sistema permite solicitar permissão 'Tecnico'

Scenario: Validar se é permitido cadastro solicitando permissão 'Tecnico'

    Given #0109: que eu esteja na tela de cadastro.
    When #0109: eu preencher os campos pertinentes com nome "UsuarioTecnico", password "12345678" e permissao "Técnico"
        And #0109: eu clicar no botão cadastrar.
    Then #0109: eu vejo uma mensagem de boas vindas com nome "UsuarioTecnico"