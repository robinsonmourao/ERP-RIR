# language: pt

Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero entrar no sistema sem informar nenhuma senha.
-Para verificar que o sistema não permite o acesso sem uma senha

Cenário: Validar se é permitido entrar sem informar nenhuma senha

    Dado #003004: eu já tenha meu usuário cadastrado com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #003004: que eu esteja na tela entrar.
    Quando #003004: eu preencher os campos pertinentes com nome "UsuarioSuper" e password ""
        E #003004: eu clicar no botão Entrar.
    Então #003004: eu vejo um alerta informando que o campo não pode ser vazio