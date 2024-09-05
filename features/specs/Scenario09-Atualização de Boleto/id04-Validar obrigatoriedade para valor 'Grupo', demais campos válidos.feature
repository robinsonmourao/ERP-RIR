# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Boleto no sistema sem informar um valor para o campo 'Grupo'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Grupo', demais campos válidos

    Dado #0904: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0904: eu já tenha criado um Cliente, Site, Fornecedor, Atendimento, Status, Fatura e Boleto previamente
        E #0904: eu tiver passado o mouse sobre a aba "Boletos"
        E #0904: eu tenha clicado no link "Listar todos"
        E #0904: eu tenha clicado no link Editar do Boleto criado previamente.
    Quando #0904: eu escolher o item da lista Atendimento "001RIR 002fornecedor_principal"
        E #0904: eu escolher o item da lista Fatura "001(001RIR 002fornecedor_principal) 0022024-08-25 003Fatura não agrupada"
        E #0904: eu escolher o item da lista Agrupamento ""
        E #0904: eu escolher o item da lista Status "001f 002fornecedor_principal 003Ativo"
        E #0904: eu escolher o item da lista data de vencimento "2024-08-25"
        E #0904: eu clicar no botão Enviar.
    Então #0904: eu vejo um balão informando que é obrigatório selecionar um item para Fatura.