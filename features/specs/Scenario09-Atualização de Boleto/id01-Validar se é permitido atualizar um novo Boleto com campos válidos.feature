# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
@apagar_atendimentos_remanscentes_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Boleto.
-Para corrigir algum dado inserido incorretamente na criação.

Cenário: Validar se é permitido atualizar um Boleto com campos válidos

    Dado #0901: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0901: eu já tenha criado um Cliente, Site, Fornecedor, Atendimento, Status, Fatura e Boleto previamente
        E #0901: eu já tenha criado um Cliente, Site, Fornecedor, Atendimento, Status e Fatura com valores alternativos
        E #0901: eu tiver passado o mouse sobre a aba "Boletos"
        E #0901: eu tenha clicado no link "Listar todos"
        E #0901: eu tenha clicado no link Editar do Boleto criado previamente.
    Quando #0901: eu escolher o item da lista Atendimento "001RIR2 002fornecedor_alternativo"
        E #0901: eu escolher o item da lista Fatura "001(001RIR2 002fornecedor_alternativo) 0022024-08-25 003Fatura não agrupada"
        E #0901: eu escolher o item da lista Agrupamento "Fatura não agrupada"
        E #0901: eu escolher o item da lista Status "001f 002(001f 002fornecedor_alternativo) 003Pendente"
        E #0901: eu escolher o item da lista data de vencimento "2024-08-25"
        E #0901: eu clicar no botão Enviar.
    Então #0901: eu sou redirecionado para detalhes do novo Boleto criado contendo valores informados e valores autopreenchidos
        E #0901: eu vejo a informação de que o Boleto foi atualizado com sucesso com o valor de codigo_boleto_composto "Boleto com codigo boleto composto '001(001RIR2 002fornecedor_alternativo) 0022024-08-25 003Fatura não agrupada' foi ATUALIZADO com sucesso.".