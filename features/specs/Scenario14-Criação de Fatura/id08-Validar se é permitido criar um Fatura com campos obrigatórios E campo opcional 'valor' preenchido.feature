# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
@apagar_atendimentos_remanscentes_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar uma nova Fatura no sistema informando um valor para o campo opcional 'valor'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido criar um Fatura com campos obrigatórios E campo opcional 'valor' preenchido

    Dado #1408: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1408: eu já tenha criado um Atendimento e Status previamente
        E #1408: eu tiver passado o mouse sobre a aba "Faturas"
        E #1408: eu tiver clicado em "Novo".
    Quando #1408: eu escolher o item da lista Atendimentos "001RIR 002fornecedor_principal"        
        E #1408: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1408: eu escolher o item da lista Meio de pagamento "Boleto"
        E #1408: eu escolher o item da lista Status "001a 002(001a 002RIR 003fornecedor_principal) 003Pendente"
        E #1408: eu preencher o campo valor "79,90"
        E #1408: eu clicar no botão Enviar.
    Então #1408: eu sou redirecionado para detalhes da nova Fatura criada contendo valores informados
        E #1408: eu vejo a informação de que a Fatura foi criada com sucesso contendo o valor de código fatura composto.