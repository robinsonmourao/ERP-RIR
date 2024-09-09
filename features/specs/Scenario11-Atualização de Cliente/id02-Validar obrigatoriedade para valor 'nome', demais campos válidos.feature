# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Cliente no sistema sem informar um valor para o campo 'nome'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'nome', demais campos válidos

    Dado #1102: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1102: eu já tenha criado um Cliente previamente
        E #1102: eu tiver passado o mouse sobre a aba "Clientes"
        E #1102: eu tenha clicado no link "Listar todos"
        E #1102: eu tenha clicado no link Editar do Cliente criado previamente.
    Quando #1102: eu preencher o campo nome ""
        E #1102: eu preencher o campo cnpj "XXXXXXXXXXXX01"
        E #1102: eu clicar no botão Enviar.
    Então #1102: eu vejo um alerta informando que o campo não pode ser vazio.