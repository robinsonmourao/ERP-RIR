# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Atualização no sistema

-Eu como usuário.
-Quero criar um novo Contato no sistema sem informar um valor para o campo 'origem'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade do campo 'origem', demais campos válidos

    Dado #1302: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1302: eu já tenha criado um Contato previamente
        E #1302: eu tiver passado o mouse sobre a aba "Contatos"
        E #1302: eu tenha clicado no link "Listar todos"
        E #1302: eu tenha clicado no link Editar do Contato criado previamente.
    Quando #1302: eu escolher o item da lista originários ""
        #1302: eu escolher o item da lista Tipo de contato "Dono"
        E #1302: eu escolher o item da lista Meio de contato "Whatsapp"
        E #1302: eu preencher o campo descrição "00 00000-0000"
        E #1302: eu clicar no botão Enviar.
    Então #1302: eu vejo um balão informando que é obrigatório selecionar um item para Contato.