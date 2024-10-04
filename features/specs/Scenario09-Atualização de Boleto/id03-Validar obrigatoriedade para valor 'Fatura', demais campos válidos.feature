# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_atendimentos_remanscentes_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Boleto no sistema sem informar um valor para o campo 'Fatura'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Fatura', demais campos válidos

    Dado #0903: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0903: eu já tenha criado um Cliente, Site, Fornecedor, Atendimento, Status, Fatura e Boleto previamente
        E #0903: eu tiver passado o mouse sobre a aba "Boletos"
        E #0903: eu tenha clicado no link "Listar todos"
        E #0903: eu tenha clicado no link Editar do Boleto criado previamente.
    Quando #0903: eu escolher o item da lista Atendimento "001RIR 002fornecedor_principal"
        E #0903: eu escolher o item da lista Fatura ""
        E #0903: eu escolher o item da lista Agrupamento "Fatura não agrupada"
        E #0903: eu escolher o item da lista Status "001f 002(001f 002fornecedor_principal) 003Ativo"
        E #0903: eu escolher o item da lista data de vencimento "2024-08-25"
        E #0903: eu clicar no botão Enviar.
    Então #0903: eu vejo um balão informando que é obrigatório selecionar um item para Fatura.