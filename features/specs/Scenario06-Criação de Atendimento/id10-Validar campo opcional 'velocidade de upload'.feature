# language: pt

@skip
@apagar_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Atendimento no sistema informando um valor para 'velocidade de upload'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar campo opcional 'velocidade de upload'

    Dado #0610: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0610: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0610: eu tiver passado o mouse sobre a aba Atendimentos
        E #0610: eu tiver clicado em "Novo".
    Quando #0610: eu escolher o item da lista Designação "RIR"
        E #0610: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0610: eu preencher o campo velocidade de download "10"
        E #0610: eu preencher o campo velocidade de upload "1"
        E #0610: eu clicar no botão Enviar.
    Então #0610: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados
        E #0610: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.