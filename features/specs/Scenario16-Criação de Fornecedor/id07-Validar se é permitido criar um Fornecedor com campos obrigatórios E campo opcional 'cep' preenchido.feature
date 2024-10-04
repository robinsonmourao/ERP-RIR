# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Fornecedor no sistema informando um valor para o campo opcional 'cep'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido criar um Fornecedor com campos obrigatórios E campo opcional 'cep' preenchido

    Dado #1607: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1607: eu tiver passado o mouse sobre a aba "Fornecedores"
        E #1607: eu tiver clicado em "Novo".
    Quando #1607: eu preencher o campo nome fornecedor "fornecedor_principal"
        E #1607: eu preencher o campo cep "00000-000"
        E #1607: eu clicar no botão Enviar.
    Então #1607: eu sou redirecionado para detalhes do novo Fornecedor criado contendo valores informados
        E #1607: eu vejo a informação de que o Fornecedor foi criado com sucesso contendo o valor de nome do fornecedor.