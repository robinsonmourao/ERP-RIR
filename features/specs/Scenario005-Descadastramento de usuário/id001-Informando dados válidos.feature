# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me descadastrar no sistema.
-Para eliminar meu vínculo com o sistema

Cenário: Validar se é permitido descadastrar usuário com dados válidos

    Dado #005001: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E eu esteja na tela de visão geral da conta
    Quando eu clicar em Fechar minha conta 
        E eu preencher o campo com minha atual password "12345678".
    Então eu sou redirecionado para tela entrar.
        E #005001: eu vejo uma mensagem de confirmação de remoção de conta com nome "UsuarioSuper"