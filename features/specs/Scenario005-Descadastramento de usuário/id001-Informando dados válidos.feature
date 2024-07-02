# language: en

Feature: Cadastrar no sistema

-Eu como usuário.
-Quero me descadastrar no sistema.
-Para eliminar meu vínculo com o sistema

Scenario: Validar se é permitido descadastrar usuário com dados válidos

    Given #CADASTRAMENTO_TO_DESCADASTRAMENTO_LENIENT_CONTEXT: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        And eu esteja na tela de visão geral da conta
    When clico em Fechar minha conta 
        And preencha o campo com minha atual password "12345678".
    Then sou redirecionado para tela entrar.
        And #MESSAGE_TO_DESCADASTRAMENTO_LENIENT_CONTEXT: vejo uma mensagem de confirmação de remoção de conta com nome "UsuarioSuper"