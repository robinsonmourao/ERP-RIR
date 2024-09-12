# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Fornecedor no sistema informando um valor para o campo opcional 'Municipio'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido criar um Fornecedor com campos obrigatórios E campo opcional 'Municipio' preenchido

    Dado #1603: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1603: eu já tenha criado um Municipio "Salvador" escolhendo Uf "BA" previamente
        E #1603: eu tiver passado o mouse sobre a aba "Fornecedores"
        E #1603: eu tiver clicado em "Novo".
    Quando #1603: eu preencher o campo nome fornecedor "fornecedor_principal"
        E #1603: eu escolher o item da lista Municipios "Salvador"
        E #1603: eu clicar no botão Enviar.
    Então #1603: eu sou redirecionado para detalhes do novo Fornecedor criado contendo valores informados
        E #1603: eu vejo a informação de que o Fornecedor foi criado com sucesso contendo o valor de nome do fornecedor.