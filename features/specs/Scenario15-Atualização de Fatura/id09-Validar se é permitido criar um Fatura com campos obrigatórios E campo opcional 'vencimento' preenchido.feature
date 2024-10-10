# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_objetos_remanscentes_de_fatura
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar uma Fatura no sistema informando um valor para o campo opcional 'vencimento'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido criar um Fatura com campos obrigatórios E campo opcional 'vencimento' preenchido

    Dado #1509: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1509: eu já tenha criado um Atendimento, Status e Fatura previamente
        E #1509: eu tiver passado o mouse sobre a aba "Faturas"
        E #1509: eu tenha clicado no link "Listar todos"
        E #1509: eu tenha clicado no link Editar da Fatura criada previamente.
    Quando #1509: eu escolher o item da lista Atendimentos "001RIR 002fornecedor_principal"        
        E #1509: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1509: eu escolher o item da lista Meio de pagamento "Boleto"
        E #1509: eu escolher o item da lista Status "001a 002(001a 002RIR 003fornecedor_principal) 003Pendente"
        E #1509: eu preencher o campo data de vencimento "2024-09-10"
        E #1509: eu clicar no botão Enviar.
    Então #1509: eu sou redirecionado para detalhes da Fatura contendo valores atualizados
        E #1509: eu vejo a informação de que a Fatura foi atualizada com sucesso contendo o valor de código fatura composto.