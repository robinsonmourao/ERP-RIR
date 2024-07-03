# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema solicitando permissão 'Tecnico'
-Para verificar que o sistema permite solicitar permissão 'Tecnico'

Cenário: Validar se é permitido cadastro solicitando permissão 'Tecnico'

    Dado #001009: que eu esteja na tela de cadastro.
    Quando #001009: eu preencher os campos pertinentes com nome "UsuarioTecnico", password "12345678" e permissao "Técnico"
        E #001009: eu clicar no botão cadastrar.
    Então #001009: eu vejo uma mensagem de boas vindas com nome "UsuarioTecnico"