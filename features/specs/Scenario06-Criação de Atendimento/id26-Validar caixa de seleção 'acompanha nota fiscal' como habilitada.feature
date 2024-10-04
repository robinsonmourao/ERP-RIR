# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Atendimento no sistema marcando a caixa 'acompanha nota fiscal'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar campo opcional 'acompanha nota fiscal' como habilitada

    Dado #0626: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0626: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0626: eu tiver passado o mouse sobre a aba Atendimentos
        E #0626: eu tiver clicado em "Novo".
    Quando #0626: eu escolher o item da lista Designação "RIR"
        E #0626: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0626: eu preencher o campo velocidade de download "10"
        E #0626: eu selecione a caixa de seleção acompanha nota fiscal como habilitada
        E #0626: eu clicar no botão Enviar.
    Então #0626: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados
        E #0626: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.