# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Fornecedor no sistema.
-Para corrigir algum dado inserido incorretamente na criação.

Cenário: Validar se é permitido atualizar um Fornecedor com campos válidos

    Dado #1701: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1701: eu já tenha criado um Fornecedor previamente
        E #1701: eu tiver passado o mouse sobre a aba "Fornecedores"
        E #1701: eu tenha clicado no link "Listar todos"
        E #1701: eu tenha clicado no link Editar do Fornecedor criado previamente.
    Quando #1701: eu preencher o campo nome fornecedor "fornecedor_alternativo"
        E #1701: eu clicar no botão Enviar.
    Então #1701: eu sou redirecionado para detalhes do Fornecedor contendo valores atualizados
        E #1701: eu vejo a informação de que o Fornecedor foi atualizado com sucesso contendo o valor de nome do fornecedor.