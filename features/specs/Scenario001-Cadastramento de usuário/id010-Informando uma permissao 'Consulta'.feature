# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema solicitando permissão 'Consulta'
-Para verificar que o sistema permite solicitar permissão 'Consulta'

Cenário: Validar se é permitido cadastro solicitando permissão 'Consulta'

    Dado #001010: que eu esteja na tela de cadastro.
    Quando #001010: eu preencher os campos pertinentes com nome "UsuarioConsulta", password "12345678" e permissao "Consulta"
        E #001010: eu clicar no botão cadastrar.
    Então #001010: eu vejo uma mensagem de boas vindas com nome "UsuarioConsulta"