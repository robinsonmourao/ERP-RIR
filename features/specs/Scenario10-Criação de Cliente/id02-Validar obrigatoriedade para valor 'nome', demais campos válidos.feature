# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Cliente no sistema sem informar um valor para o campo 'nome'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'nome', demais campos válidos

    Dado #1002: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1002: eu tiver passado o mouse sobre a aba "Clientes"
        E #1002: eu tiver clicado em "Novo".
    Quando #1002: eu preencher o campo cnpj "XXXXXXXXXXXX01"
        E #1002: eu clicar no botão Enviar.
    Então #1002: eu vejo um alerta informando que o campo não pode ser vazio.