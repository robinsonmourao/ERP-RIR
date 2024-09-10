# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Contato no sistema sem informar um valor para o campo 'Meio de contato'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Meio de contato', demais campos válidos

    Dado #1204: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1204: eu tiver passado o mouse sobre a aba "Contatos"
        E #1204: eu tiver clicado em "Novo".
    Quando #1204: eu escolher o item da lista originários "cliente"
        E #1204: eu escolher o item da lista Tipo de contato "Dono"
        E #1204: eu preencher o campo descrição "00 00000-0000"
        E #1204: eu clicar no botão Enviar.
    Então #1204: eu vejo um balão informando que é obrigatório selecionar um item para Meio de contato.