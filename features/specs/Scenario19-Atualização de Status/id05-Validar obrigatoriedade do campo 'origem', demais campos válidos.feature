# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Status no sistema sem informar um valor para o campo 'origem'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade do campo 'origem', demais campos válidos

    Dado #1905: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1905: eu já tenha criado um Cliente e Status previamente
        E #1905: eu tiver passado o mouse sobre a aba Status
        E #1905: eu tenha clicado no link "Listar todos"
        E #1905: eu tenha clicado no link Editar do Status criado previamente.
    Quando #1905: eu escolher o item da Originário ""
        E #1905: eu clicar no botão Enviar.
    Então #1905: eu vejo um balão informando que é obrigatório selecionar um item para origem.