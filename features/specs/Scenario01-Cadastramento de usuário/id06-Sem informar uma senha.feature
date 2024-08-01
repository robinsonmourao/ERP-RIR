# language: pt

@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema sem informar nenhuma senha.
-Para verificar que o sistema não permite o cadastro sem uma senha

Cenário: Validar se é permitido cadastro sem informar nenhuma senha

    Dado #0106: que eu esteja na tela de cadastro.
    Quando #0106: eu preencher os campos pertinentes com nome "UsuarioSuper", password "" e permissao "Super"
        E #0106: eu clicar no botão cadastrar.
    Então #0106: eu vejo um alerta informando que o campo não pode ser vazio