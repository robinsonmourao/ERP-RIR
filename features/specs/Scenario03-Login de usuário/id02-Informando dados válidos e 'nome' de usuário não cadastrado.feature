# language: pt

@skip
Funcionalidade: Entrar no sistema

-Eu como usuário.
-Quero entrar no sistema.
-Para poder acessar as funcionalidades do sistema.

Cenário: Validar se é permitido entrar informando um nome de usuário não cadastrado com demais dados válidos

    Dado #0302: que eu NÃO possua o usuário cadastrado no sistema
        E #0302 eu esteja na tela entrar.
    Quando #0302 eu preencher os campos pertinentes com nome "UsuarioSuper" e password "12345678"
        E #0302 eu clicar no botão Entrar.
    Então #0302: eu vejo uma mensagem LARANJA informando que usuario com nome "UsuarioSuper" não foi encontrado.