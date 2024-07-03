# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema solicitando permissão 'Administrativo'
-Para verificar que o sistema permite solicitar permissão 'Administrativo'

Cenário: Validar se é permitido cadastro solicitando permissão 'Administrativo'

    Dado #001008: que eu esteja na tela de cadastro.
    Quando #001008: eu preencher os campos pertinentes com nome "UsuarioAdministrativo", password "12345678" e permissao "Administrativo"
        E #001008: eu clicar no botão cadastrar.
    Então #001008: eu vejo uma mensagem de boas vindas com nome "UsuarioAdministrativo"