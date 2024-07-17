# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me descadastrar no sistema com senha errada.
-Para validar se o sistema aceita remoção de contas com senhas erradas

Cenário: Validar se é permitido descadastrar usuário com senha errada

    Dado #0502 eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0502 eu esteja na tela de visão geral da conta.
    Quando #0502 eu clicar em Fechar minha conta 
        E #0502 eu preencha o campo com uma senha incorreta password "87654321".
    Então #0502 eu vejo uma mensagem dizendo que a senha que informei está incorreta.