# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Contato no sistema sem informar um valor para o campo 'Tipo de contato'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Tipo de contato', demais campos válidos

    Dado #1203: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1203: eu tiver passado o mouse sobre a aba "Contatos"
        E #1203: eu tiver clicado em "Novo".
    Quando #1203: eu escolher o item da lista originários "cliente"
        E #1203: eu escolher o item da lista Meio de contato "Whatsapp"
        E #1203: eu preencher o campo descrição "00 00000-0000"
        E #1203: eu clicar no botão Enviar.
    Então #1203: eu vejo um balão informando que é obrigatório selecionar um item para Tipo de contato.