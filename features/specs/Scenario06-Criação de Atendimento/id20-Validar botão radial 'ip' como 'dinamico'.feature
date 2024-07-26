# language: pt

@skip
@apagar_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Atendimento no sistema informando o valor 'dinamico' para 'Categoria do ip'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar campo opcional 'Categoria do ip' como 'dinamico'

    Dado #0620: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0620: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0620: eu tiver passado o mouse sobre a aba Atendimentos
        E #0620: eu tiver clicado em "Novo".
    Quando #0620: eu escolher o item da lista Designação "RIR"
        E #0620: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0620: eu preencher o campo velocidade de download "10"
        E #0620: eu escolher o botão radial de Categoria do ip dinamico
        E #0620: eu clicar no botão Enviar.
    Então #0620: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados
        E #0620: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.