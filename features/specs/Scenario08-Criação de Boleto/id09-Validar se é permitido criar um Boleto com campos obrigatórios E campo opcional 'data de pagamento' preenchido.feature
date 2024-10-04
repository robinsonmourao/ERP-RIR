# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
@apagar_atendimentos_remanscentes_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Boleto no sistema informando um valor para 'data de pagamento'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido criar um Boleto com campos obrigatórios E campo opcional 'data de pagamento' preenchido

    Dado #0809: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0809: eu já tenha criado um Cliente, Site, Fornecedor, Atendimento, Status e Fatura previamente
        E #0809: eu tiver passado o mouse sobre a aba "Boletos"
        E #0809: eu tiver clicado em "Novo".
    Quando #0809: eu escolher o item da lista Atendimento "001RIR 002fornecedor_principal"
        E #0809: eu escolher o item da lista Fatura "001(001RIR 002fornecedor_principal) 0022024-08-25 003Fatura não agrupada"
        E #0809: eu escolher o item da lista Agrupamento "Fatura não agrupada"
        E #0809: eu escolher o item da lista Status "001f 002(001f 002fornecedor_principal) 003Ativo"
        E #0809: eu escolher o item da lista data de vencimento "2024-08-25"
        E #0809: eu preencher o campo data de pagamento "2024-08-10"
        E #0809: eu clicar no botão Enviar.
    Então #0809: eu sou redirecionado para detalhes do novo Boleto criado contendo valores informados e valores autopreenchidos
        E #0809: eu vejo a informação de que o Boleto foi criado com sucesso com o valor de codigo_boleto_composto "Boleto com codigo boleto composto '001(001RIR 002fornecedor_principal) 0022024-08-25 003Fatura não agrupada' foi criado com sucesso.".