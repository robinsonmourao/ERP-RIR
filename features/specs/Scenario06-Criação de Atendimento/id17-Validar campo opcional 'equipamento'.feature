# language: pt
@skip
@apagar_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Atendimento no sistema informando um valor para 'Equipamento'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar campo opcional 'Equipamento'

    Dado #0617: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0617: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0617: eu tiver passado o mouse sobre a aba Atendimentos
        E #0617: eu tiver clicado em "Novo".
    Quando #0617: eu escolher o item da lista Designação "RIR"
        E #0617: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0617: eu preencher o campo velocidade de download "10"
        E #0617: eu escolher o item da lista Equipamento "RB750R2"
        E #0617: eu clicar no botão Enviar.
    Então #0617: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados
        E #0617: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.