# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Cliente no sistema sem informar um valor para o campo 'cnpj'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'cnpj', demais campos válidos

    Dado #1003: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1003: eu tiver passado o mouse sobre a aba "Clientes"
        E #1003: eu tiver clicado em "Novo".
    Quando #1003: eu preencher o campo nome "cliente_principal"
        E #1003: eu clicar no botão Enviar.
    Então #1003: eu vejo um alerta informando que o campo não pode ser vazio.