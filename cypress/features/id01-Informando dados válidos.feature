Feature: Cadastrar Usuário no sistema

Scenario: Validar se é permitido cadastro de usuário com dados válidos

    Given que eu esteja na tela de cadastro.
    When eu preencher os campos pertinentes com nome "UsuarioSuper", password "12345678" e permissao "Super"
        And eu clicar no botão cadastrar.
    Then eu sou redirecionado para dashboard
        And eu vejo uma mensagem de boas vindas com nome "UsuarioSuper"