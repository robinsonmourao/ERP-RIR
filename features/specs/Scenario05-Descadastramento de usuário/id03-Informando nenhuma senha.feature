# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me descadastrar no sistema sem informar nenhuma senha
-Para validar se o sistema aceita remoção de contas sem ter informado nenhuma senha

Cenário: Validar se é permitido descadastrar usuário com dados válidos

    Dado #0503 eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0503 eu esteja na tela de visão geral da conta.
    Quando #0503 eu clicar em Fechar minha conta 
        E #0503 eu preencha o campo com uma senha incorreta password "".
    Então #0503 eu vejo um alerta dizendo que é necessário preencher o campo senha.