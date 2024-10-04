# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_atendimentos_remanscentes_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar uma nova Fatura no sistema sem informar um valor para o campo 'Meio de pagamento'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Meio de pagamento', demais campos válidos

    Dado #1404: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1404: eu já tenha criado um Atendimento e Status previamente
        E #1404: eu tiver passado o mouse sobre a aba "Faturas"
        E #1404: eu tiver clicado em "Novo".
    Quando #1404: eu escolher o item da lista Atendimentos "001RIR 002fornecedor_principal"        
        E #1404: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1404: eu escolher o item da lista Status "001a 002(001a 002RIR 003fornecedor_principal) 003Pendente"
        E #1404: eu clicar no botão Enviar.
    Então #1404: eu vejo um balão informando que é obrigatório selecionar um item para Meio de pagamento.