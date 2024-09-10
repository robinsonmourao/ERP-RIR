# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Atualização no sistema

-Eu como usuário.
-Quero atualizar Contato no sistema sem informar um valor para o campo 'Meio de contato'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade do campo 'meio de contato', demais campos válidos

    Dado #1304: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1304: eu já tenha criado um Contato previamente
        E #1304: eu tiver passado o mouse sobre a aba "Contatos"
        E #1304: eu tenha clicado no link "Listar todos"
        E #1304: eu tenha clicado no link Editar do Contato criado previamente.
    Quando #1304: eu escolher o item da lista originários "cliente"
        E #1304: eu escolher o item da lista Tipo de contato "Dono"
        E #1304: eu escolher o item da lista Meio de contato ""
        E #1304: eu preencher o campo descrição "00 00000-0000"
        E #1304: eu clicar no botão Enviar.
    Então #1304: eu vejo um balão informando que é obrigatório selecionar um item para Meio de contato.