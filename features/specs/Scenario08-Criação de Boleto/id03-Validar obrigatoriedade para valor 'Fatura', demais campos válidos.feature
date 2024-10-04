# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Boleto no sistema sem informar um valor para o campo 'Fatura'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Fatura', demais campos válidos

    Dado #0803: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0803: eu já tenha criado um Cliente, Site, Fornecedor, Atendimento e Status previamente
        E #0803: eu tiver passado o mouse sobre a aba "Boletos"
        E #0803: eu tiver clicado em "Novo".
    Quando #0801: eu escolher o item da lista Atendimento "001RIR 002fornecedor_principal"
        E #0803: eu escolher o item da lista Agrupamento "Fatura não agrupada"
        E #0803: eu escolher o item da lista Status "001f 002(001f 002fornecedor_principal) 003Ativo"
        E #0803: eu escolher o item da lista data de vencimento "2024-08-25"
        E #0803: eu clicar no botão Enviar.
    Então #0803: eu vejo um balão informando que é obrigatório selecionar um item para Fatura.