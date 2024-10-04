# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Atualização no sistema

-Eu como usuário.
-Quero atualizar um Contato no sistema sem informar um valor para o campo 'descricao'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade do campo 'descricao', demais campos válidos

    Dado #1305: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1305: eu já tenha criado um Contato previamente
        E #1305: eu tiver passado o mouse sobre a aba "Contatos"
        E #1305: eu tenha clicado no link "Listar todos"
        E #1305: eu tenha clicado no link Editar do Contato criado previamente.
    Quando #1305: eu escolher o item da lista originários "cliente"
        E #1305: eu escolher o item da lista Tipo de contato "Dono"
        E #1305: eu escolher o item da lista Meio de contato "Whatsapp"
        E #1305: eu preencher o campo descrição ""
        E #1305: eu clicar no botão Enviar.
    Então #1305: eu vejo um alerta informando que o campo descricao não pode ser vazio.