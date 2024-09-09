# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Cliente no sistema informando um 'cnpj' menor que 14.
-Para verificar a validação de tamanho do campo.

Cenário: Validar se é permitido cadastro de Cliente informando um 'cnpj' MENOR que 14 caracteres, demais campos válidos

    Dado #1004: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1004: eu tiver passado o mouse sobre a aba "Clientes"
        E #1004: eu tiver clicado em "Novo".
    Quando #1004: eu preencher o campo nome "cliente_principal"
        E #1004: eu preencher o campo cnpj "01"
        E #1004: eu clicar no botão Enviar.
    Então #1004: eu vejo um alerta informando que o campo não pode ser vazio.