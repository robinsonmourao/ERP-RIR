# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema sem informar nenhum nome.
-Para verificar que o sistema não permite o cadastro sem um nome

Cenário: Validar se é permitido cadastro sem informar nenhum um nome

    Dado #0103: que eu esteja na tela de cadastro.
    Quando #0103: eu preencher os campos pertinentes com nome "", password "12345678" e permissao "Super"
        E #0103: eu clicar no botão cadastrar.
    Então #0103: eu vejo um alerta informando que o campo não pode ser vazio