# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Fornecedor no sistema.
-Para utilizar seus dados posteriormente.

Cenário: Validar se é permitido cadastrar um novo Fornecedor com campos válidos

    Dado #1601: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1601: eu tiver passado o mouse sobre a aba "Fornecedores"
        E #1601: eu tiver clicado em "Novo".
    Quando #1601: eu preencher o campo nome fornecedor "fornecedor_principal"
        E #1601: eu clicar no botão Enviar.
    Então #1601: eu sou redirecionado para detalhes do novo Fornecedor criado contendo valores informados
        E #1601: eu vejo a informação de que o Fornecedor foi criado com sucesso contendo o valor de nome do fornecedor.