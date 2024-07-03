# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero verificar se o sistema me avisa quando eu já estiver cadastrado.
-Para evitar duplicidade de cadastros

Cenário: Validar se é permitido cadastro de usuário duplicados com dados válidos

    Dado que eu esteja na tela de cadastro
        E #001002: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
    Quando eu preencher os campos pertinentes com MESMO nome "UsuarioSuper" cadastrado anteriormente, password "12345678" e permissao "Super"
        E eu clicar no botão Cadastrar
    Então eu vejo que o nome "UsuarioSuper" já está em uso.