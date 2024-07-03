# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema sem informar nenhum nome.
-Para verificar que o sistema não permite o cadastro sem um nome

Cenário: Validar se é permitido cadastro sem informar nenhum um nome

    Dado #001003: que eu esteja na tela de cadastro.
    Quando #001003: eu preencher os campos pertinentes com nome "", password "12345678" e permissao "Super"
        E #001003: eu clicar no botão cadastrar.
    Então #001003: eu vejo um alerta informando que o campo não pode ser vazio