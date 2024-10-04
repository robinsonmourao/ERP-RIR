# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
@apagar_atendimentos_remanscentes_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar uma Fatura no sistema.
-Para corrigir algum dado inserido incorretamente na criação.

Cenário: Validar se é permitido atualizar uma Fatura com campos válidos

    Dado #1501: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1501: eu já tenha criado um Atendimento, Status e Fatura previamente
        E #1501: eu já tenha criado um Atendimento e Status com valores alternativos
        E #1501: eu tiver passado o mouse sobre a aba "Faturas"
        E #1501: eu tenha clicado no link "Listar todos"
        E #1501: eu tenha clicado no link Editar da Fatura criada previamente.
    Quando #1501: eu escolher o item da lista Atendimentos "001RIR2 002fornecedor_alternativo"
        E #1501: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1501: eu escolher o item da lista Meio de pagamento "Pix"
        E #1501: eu escolher o item da lista Status "001a 002(001a 002RIR2 003fornecedor_alternativo) 003Ativo"
        E #1501: eu preencher o campo data de vencimento diferente do padrão, "2024-09-30"
        E #1501: eu clicar no botão Enviar.
    Então #1501: eu sou redirecionado para detalhes da Fatura contendo valores atualizados
        E #1501: eu vejo a informação de que a Fatura foi atualizada com sucesso contendo o valor de código fatura composto.