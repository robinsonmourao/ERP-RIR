# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Status no sistema sem informar um valor para o campo 'Situação'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade do campo 'Situação', demais campos válidos

    Dado #1806: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1806: eu já tenha criado um Site previamente
        E #1806: eu tiver passado o mouse sobre a aba Status
        E #1806: eu tiver clicado em "Novo".
    Quando #1806: eu escolher o item da lista Situação ""
        E #1806: eu clicar no botão Enviar.
    Então #1806: eu vejo um balão informando que é obrigatório selecionar um item para Situação.