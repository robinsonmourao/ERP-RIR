# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Cliente no sistema sem informar um valor para o campo 'cnpj'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'cnpj', demais campos válidos

    Dado #1103: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1103: eu já tenha criado um Cliente previamente
        E #1103: eu tiver passado o mouse sobre a aba "Clientes"
        E #1103: eu tenha clicado no link "Listar todos"
        E #1103: eu tenha clicado no link Editar do Cliente criado previamente.
    Quando #1103: eu preencher o campo nome "cliente_alternativo"
        E #1103: eu preencher o campo cnpj ""
        E #1103: eu clicar no botão Enviar.
    Então #1103: eu vejo um alerta informando que o campo não pode ser vazio.