# language: pt
@skip
Funcionalidade: Sair no sistema

-Eu como usuário.
-Quero clicar no botão sair.
-Para fechar minha sessão no sistema.

Cenário: Validar se o botão 'Sair' fecha sessões adequadamente

    Dado #0401 eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0401 eu esteja em qualquer tela dentro do sistema.
    Quando #0401 eu clicar no botão Sair.
    Então #0401 eu sou redirecionado para tela entrar
        E #0401 eu vejo uma mensagem laranja me informando que fui desconectado!