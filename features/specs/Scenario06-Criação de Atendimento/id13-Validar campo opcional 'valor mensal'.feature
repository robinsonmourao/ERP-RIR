# language: pt
@skip
@apagar_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Atendimento no sistema informando um valor para 'valor mensal'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar campo opcional 'valor mensal'

    Dado #0613: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0613: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0613: eu tiver passado o mouse sobre a aba Atendimentos
        E #0613: eu tiver clicado em "Novo".
    Quando #0613: eu escolher o item da lista Designação "RIR"
        E #0613: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0613: eu preencher o campo velocidade de download "10"
        E #0613: eu preencher o campo valor mensal "79.90"
        E #0613: eu clicar no botão Enviar.
    Então #0613: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados
        E #0613: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.