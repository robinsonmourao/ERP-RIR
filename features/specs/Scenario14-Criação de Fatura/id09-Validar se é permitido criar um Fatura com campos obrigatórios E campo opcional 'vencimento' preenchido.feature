# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar

@apagar_atendimentos_ao_terminar
@apagar_statuses_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar uma nova Fatura no sistema sem informar um valor para o campo 'vencimento'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar se é permitido criar um Fatura com campos obrigatórios E campo opcional 'vencimento' preenchido

    Dado #1409: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1409: eu já tenha criado um Atendimento e Status previamente
        E #1409: eu tiver passado o mouse sobre a aba "Faturas"
        E #1409: eu tiver clicado em "Novo".
    Quando #1409: eu escolher o item da lista Atendimentos "001RIR 002fornecedor_principal"        
        E #1409: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1409: eu escolher o item da lista Meio de pagamento "Boleto"
        E #1409: eu escolher o item da lista Status "001a 002(001RIR 002fornecedor_principal) 003Pendente"
        E #1409: eu preencher o campo data de vencimento "2024-09-10"
        E #1409: eu clicar no botão Enviar.
    Então #1409: eu sou redirecionado para detalhes da nova Fatura criada contendo valores informados
        E #1409: eu vejo a informação de que a Fatura foi criada com sucesso contendo o valor de código fatura composto.