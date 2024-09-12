# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Fornecedor no sistema sem informar um valor para o campo 'nome'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'nome'

    Dado #1702: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1702: eu já tenha criado um Fornecedor previamente
        E #1702: eu tiver passado o mouse sobre a aba "Fornecedores"
        E #1702: eu tenha clicado no link "Listar todos"
        E #1702: eu tenha clicado no link Editar do Fornecedor criado previamente.
    Quando #1702: eu preencher o campo nome fornecedor ""
    Então #1702: eu vejo um alerta informando que o campo não pode ser vazio.