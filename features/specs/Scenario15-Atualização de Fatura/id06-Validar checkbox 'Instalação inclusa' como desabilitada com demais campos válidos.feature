# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
@apagar_atendimentos_remanscentes_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar uma Fatura no sistema desmarcando a caixa 'instalação inclusa'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar checkbox 'Instalação inclusa' como desabilitada com demais campos válidos

    Dado #1506: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1506: eu já tenha criado um Atendimento, Status e Fatura previamente
        E #1506: eu tiver passado o mouse sobre a aba "Faturas"
        E #1506: eu tenha clicado no link "Listar todos"
        E #1506: eu tenha clicado no link Editar da Fatura criada previamente.
    Quando #1506: eu escolher o item da lista Atendimentos "001RIR 002fornecedor_principal"        
        E #1506: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1506: eu escolher o item da lista Meio de pagamento "Boleto"
        E #1506: eu escolher o item da lista Status "001a 002(001a 002RIR 003fornecedor_principal) 003Pendente"
        E #1506: eu selecione a caixa de seleção instalação inclusa como desabilitada
        E #1506: eu clicar no botão Enviar.
    Então #1506: eu sou redirecionado para detalhes da Fatura contendo valores atualizados
        E #1506: eu vejo a informação de que a Fatura foi atualizada com sucesso contendo o valor de código fatura composto.