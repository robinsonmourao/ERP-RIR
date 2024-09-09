# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Cliente no sistema informando um 'cnpj' maior que 14.
-Para verificar a validação de tamanho do campo.

Cenário: Validar se é permitido atualizar Cliente informando um 'cnpj' MAIOR que 14 caracteres, demais campos válidos

    Dado #1105: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1105: eu já tenha criado um Cliente previamente
        E #1105: eu tiver passado o mouse sobre a aba "Clientes"
        E #1105: eu tenha clicado no link "Listar todos"
        E #1105: eu tenha clicado no link Editar do Cliente criado previamente.
    Quando #1105: eu preencher o campo nome "cliente_principal"
        E #1105: eu preencher o campo cnpj "XXXXXXXXXXXX01X"
        E #1105: eu clicar no botão Enviar.
    Então #1105: eu vejo um alerta informando que o campo não pode ser vazio.