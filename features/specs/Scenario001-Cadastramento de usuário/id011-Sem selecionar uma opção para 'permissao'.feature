# language: pt
@skip
Funcionalidade: Cadastrar no sistema

-Eu como usuário.
-Quero me cadastrar no sistema sem selecionar nenhuma opção para permissao.
-Para verificar que o sistema não permite o cadastro sem selecionar nenhuma opção para permissao

Cenário: Validar se é permitido cadastro sem selecionar nenhuma opção para permissao

    Dado #001011: que eu esteja na tela de cadastro.
    Quando #001011: eu preencher os campos pertinentes com nome "UsuarioSuper", password "12345678" e permissao "Permissão desejada"
        E #001011: eu clicar no botão cadastrar.
    Então #001011: eu vejo um alerta informando é necessário selecionar um item da lista