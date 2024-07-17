# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema.
-Para poder acessar as funcionalidades do sistema.

Cenário: Validar se é permitido cadastro de usuário com dados válidos

    Dado que eu esteja na tela de cadastro.
    Quando eu preencher os campos pertinentes com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E eu clicar no botão cadastrar.
    Então eu sou redirecionado para dashboard
        E #0101: eu vejo uma mensagem de boas vindas com nome "UsuarioSuper"