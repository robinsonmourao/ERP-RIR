# language: pt

@skip
Feature: Cadastrar Usuário no sistema

-Eu como usuário.
-Quero me cadastrar no sistema sem selecionar nenhuma opção para permissao.
-Para verificar que o sistema não permite o cadastro sem selecionar nenhuma opção para permissao

Scenario: Validar se é permitido cadastro sem selecionar nenhuma opção para permissao

    Given #0111: que eu esteja na tela de cadastro.
    When #0111: eu preencher os campos pertinentes com nome "UsuarioSuper", password "12345678" e permissao "Permissão desejada"
        And #0111: eu clicar no botão cadastrar.
    Then #0111: eu vejo um alerta informando é necessário selecionar um item da lista