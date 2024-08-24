# language: pt

@skip
@apagar_usuario_ao_terminar
Feature: Cadastrar Usuário no sistema

-Eu como usuário.
-Quero me cadastrar no sistema solicitando permissão 'Super'
-Para verificar que o sistema permite solicitar permissão 'Super'

Scenario: Validar se é permitido cadastro solicitando permissão 'Super'

    Given #0107: que eu esteja na tela de cadastro.
    When #0107: eu preencher os campos pertinentes com nome "UsuarioSuper", password "12345678" e permissao "Super"
        And #0107: eu clicar no botão cadastrar.
    Then #0107: eu vejo uma mensagem de boas vindas com nome "UsuarioSuper"