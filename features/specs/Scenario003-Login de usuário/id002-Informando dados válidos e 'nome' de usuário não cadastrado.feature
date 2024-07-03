# language: pt
@skip
Funcionalidade: Entrar no sistema

-Eu como usuário.
-Quero entrar no sistema.
-Para poder acessar as funcionalidades do sistema.

Cenário: Validar se é permitido entrar informando um nome de usuário não cadastrado com demais dados válidos

    Dado #003002: que eu NÃO possua o usuário cadastrado no sistema
        E #003002 eu esteja na tela entrar.
    Quando #003002 eu preencher os campos pertinentes com nome "UsuarioSuper" e password "12345678" cadastrados anteriormente
        E #003002 eu clicar no botão Entrar.
    Então #003002: eu vejo uma mensagem LARANJA informando que usuario com nome "UsuarioSuper" não foi encontrado.