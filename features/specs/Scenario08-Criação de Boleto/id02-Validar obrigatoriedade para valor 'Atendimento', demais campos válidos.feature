# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_atendimentos_remanscentes_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Boleto no sistema sem informar um valor para o campo 'Atendimento'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Atendimento', demais campos válidos

    Dado #0802: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0802: eu já tenha criado um Cliente, Site, Fornecedor, Atendimento, Status e Fatura previamente
        E #0802: eu tiver passado o mouse sobre a aba "Boletos"
        E #0802: eu tiver clicado em "Novo".
    Quando #0802: eu escolher o item da lista Fatura "001(001RIR 002fornecedor_principal) 0022024-08-25 003Fatura não agrupada"
        E #0802: eu escolher o item da lista Agrupamento "Fatura não agrupada"
        E #0802: eu escolher o item da lista Status "001f 002(001f 002fornecedor_principal) 003Ativo"
        E #0802: eu escolher o item da lista data de vencimento "2024-08-25"
        E #0802: eu clicar no botão Enviar.
    Então #0802: eu vejo um balão informando que é obrigatório selecionar um item para Atendimento.