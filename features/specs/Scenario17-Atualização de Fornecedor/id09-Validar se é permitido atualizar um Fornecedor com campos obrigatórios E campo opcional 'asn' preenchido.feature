# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Fornecedor no sistema informando um valor para o campo opcional 'asn'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido atualizar um Fornecedor com campos obrigatórios E campo opcional 'asn' preenchido

    Dado #1709: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1709: eu já tenha criado um Fornecedor previamente
        E #1709: eu tiver passado o mouse sobre a aba "Fornecedores"
        E #1709: eu tenha clicado no link "Listar todos"
        E #1709: eu tenha clicado no link Editar do Fornecedor criado previamente.
    Quando #1709: eu preencher o campo nome fornecedor "fornecedor_principal"
        E #1709: eu preencher o campo asn "AS11111"
        E #1709: eu clicar no botão Enviar.
    Então #1709: eu sou redirecionado para detalhes do Fornecedor contendo valores atualizados
        E #1709: eu vejo a informação de que o Fornecedor foi atualizado com sucesso contendo o valor de nome do fornecedor.