# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema sem informar nenhum nome.
-Para verificar que o sistema não permite o cadastro com senhas maior que 12

Cenário: Validar se é permitido cadastro informando uma senha maior que 12

    Dado #001005: que eu esteja na tela de cadastro.
    Quando #001005: eu preencher os campos pertinentes com nome "UsuarioSuper", password "1234567890123" e permissao "Super"
        E #001005: eu clicar no botão cadastrar.
    Então #001005: eu vejo um alerta informando que a senha é muito curta