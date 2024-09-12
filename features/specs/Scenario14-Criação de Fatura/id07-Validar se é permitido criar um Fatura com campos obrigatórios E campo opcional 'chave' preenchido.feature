# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar uma nova Fatura no sistema informando um valor para o campo opcional 'chave'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido criar um Fatura com campos obrigatórios E campo opcional 'chave' preenchido

    Dado #1407: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1407: eu já tenha criado um Atendimento e Status previamente
        E #1407: eu tiver passado o mouse sobre a aba "Faturas"
        E #1407: eu tiver clicado em "Novo".
    Quando #1407: eu escolher o item da lista Atendimentos "001RIR 002fornecedor_principal"        
        E #1407: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1407: eu escolher o item da lista Meio de pagamento "Boleto"
        E #1407: eu escolher o item da lista Status "001a 002(001RIR 002fornecedor_principal) 003Pendente"
        E #1407: eu preencher o campo chave "dcta478j-196l-03fm-t6gh-4298er7845m2"
        E #1407: eu clicar no botão Enviar.
    Então #1407: eu sou redirecionado para detalhes da nova Fatura criada contendo valores informados
        E #1407: eu vejo a informação de que a Fatura foi criada com sucesso contendo o valor de código fatura composto.