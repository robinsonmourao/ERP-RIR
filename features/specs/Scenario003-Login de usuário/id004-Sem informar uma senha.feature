# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero entrar no sistema sem informar nenhuma senha.
-Para verificar que o sistema não permite o acesso sem uma senha

Cenário: Validar se é permitido entrar sem informar nenhuma senha

    Dado #0304: eu já tenha meu usuário cadastrado com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0304: que eu esteja na tela entrar.
    Quando #0304: eu preencher os campos pertinentes com nome "UsuarioSuper" e password ""
        E #0304: eu clicar no botão Entrar.
    Então #0304: eu vejo um alerta informando que o campo não pode ser vazio