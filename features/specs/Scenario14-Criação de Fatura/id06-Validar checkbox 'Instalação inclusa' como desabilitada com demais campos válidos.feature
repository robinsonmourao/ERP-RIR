# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar uma nova Fatura no sistema desmarcando a caixa 'instalação inclusa'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar checkbox 'Instalação inclusa' como desabilitada com demais campos válidos

    Dado #1406: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1406: eu já tenha criado um Atendimento e Status previamente
        E #1406: eu tiver passado o mouse sobre a aba "Faturas"
        E #1406: eu tiver clicado em "Novo".
    Quando #1406: eu escolher o item da lista Atendimentos "001RIR 002fornecedor_principal"        
        E #1406: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1406: eu escolher o item da lista Meio de pagamento "Boleto"
        E #1406: eu escolher o item da lista Status "001a 002(001RIR 002fornecedor_principal) 003Pendente"
        E #1406: eu selecione a caixa de seleção instalação inclusa como desabilitada
        E #1406: eu clicar no botão Enviar.
    Então #1406: eu sou redirecionado para detalhes da nova Fatura criada contendo valores informados
        E #1406: eu vejo a informação de que a Fatura foi criada com sucesso contendo o valor de código fatura composto.