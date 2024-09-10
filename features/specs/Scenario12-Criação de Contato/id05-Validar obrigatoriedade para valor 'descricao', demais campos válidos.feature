# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Contato no sistema sem informar um valor para o campo 'Meio de contato'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Meio de contato', demais campos válidos

    Dado #1205: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1205: eu tiver passado o mouse sobre a aba "Contatos"
        E #1205: eu tiver clicado em "Novo".
    Quando #1205: eu escolher o item da lista originários "cliente"
        E #1205: eu escolher o item da lista Tipo de contato "Dono"
        E #1205: eu escolher o item da lista Meio de contato "Whatsapp"
        E #1205: eu clicar no botão Enviar.
    Então #1205: eu vejo um alerta informando que o campo descricao não pode ser vazio.