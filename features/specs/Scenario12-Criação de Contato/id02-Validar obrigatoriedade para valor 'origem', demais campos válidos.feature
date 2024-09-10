# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Contato no sistema sem informar um valor para o campo 'origem'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'origem', demais campos válidos

    Dado #1202: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1202: eu tiver passado o mouse sobre a aba "Contatos"
        E #1202: eu tiver clicado em "Novo".
    Quando #1202: eu escolher o item da lista Tipo de contato "Dono"
        E #1202: eu escolher o item da lista Meio de contato "Whatsapp"
        E #1202: eu preencher o campo descrição "00 00000-0000"
        E #1202: eu clicar no botão Enviar.
    Então #1202: eu vejo um balão informando que é obrigatório selecionar um item para Contato.