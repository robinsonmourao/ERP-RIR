# language: pt

@skip
@apagar_ao_terminar
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema solicitando permissão 'Super'
-Para verificar que o sistema permite solicitar permissão 'Super'

Cenário: Validar se é permitido cadastro solicitando permissão 'Super'

    Dado #0107: que eu esteja na tela de cadastro.
    Quando #0107: eu preencher os campos pertinentes com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0107: eu clicar no botão cadastrar.
    Então #0107: eu vejo uma mensagem de boas vindas com nome "UsuarioSuper"