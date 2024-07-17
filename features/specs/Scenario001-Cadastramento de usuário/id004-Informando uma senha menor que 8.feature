# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema informando uma senha menor que 8
-Para verificar que o sistema não permite o cadastro com senhas menor que 8

Cenário: Validar se é permitido cadastro informando uma senha menor que 8

    Dado #0104: que eu esteja na tela de cadastro.
    Quando #0104: eu preencher os campos pertinentes com nome "UsuarioSuper", password "1234567" e permissao "Super"
        E #0104: eu clicar no botão cadastrar.
    Então #0104: eu vejo um alerta informando que a senha é muito curta