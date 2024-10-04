# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Fornecedor no sistema sem informar um valor para o campo 'nome'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'nome'

    Dado #1602: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1602: eu tiver passado o mouse sobre a aba "Fornecedores"
        E #1602: eu tiver clicado em "Novo".
    Quando #1602: eu clicar no botão Enviar.
    Então #1602: eu vejo um alerta informando que o campo não pode ser vazio.