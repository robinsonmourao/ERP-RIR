# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema solicitando permissão 'Tecnico'
-Para verificar que o sistema permite solicitar permissão 'Tecnico'

Cenário: Validar se é permitido cadastro solicitando permissão 'Tecnico'

    Dado #0109: que eu esteja na tela de cadastro.
    Quando #0109: eu preencher os campos pertinentes com nome "UsuarioTecnico", password "12345678" e permissao "Técnico"
        E #0109: eu clicar no botão cadastrar.
    Então #0109: eu vejo uma mensagem de boas vindas com nome "UsuarioTecnico"