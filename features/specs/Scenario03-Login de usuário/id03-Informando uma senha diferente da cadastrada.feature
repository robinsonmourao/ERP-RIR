# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me entrar no sistema informando uma senha diferente da cadastrada
-Para verificar que o sistema não permite o entrar com senha diferente da cadastrada

Cenário: Validar se é permitido entrar informando uma diferente da cadastrada

    Dado #0303: eu já tenha meu usuário cadastrado com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0303: que eu esteja na tela entrar.
    Quando #0303: eu preencher os campos pertinentes com nome "UsuarioSuper" e errar a password "87654321"
        E #0303: eu clicar no botão Entrar.
    Então #0303: eu vejo uma mensagem informando que a senha está incorreta.