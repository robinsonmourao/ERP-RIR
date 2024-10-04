# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_atendimentos_remanscentes_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar uma Fatura no sistema sem informar um valor para o campo 'Atendimento'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Atendimento', demais campos válidos

    Dado #1502: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1502: eu já tenha criado um Atendimento e Status e Fatura previamente
        E #1502: eu tiver passado o mouse sobre a aba "Faturas"
        E #1502: eu tenha clicado no link "Listar todos"
        E #1502: eu tenha clicado no link Editar da Fatura criada previamente.
    Quando #1502: eu escolher o item da lista Atendimentos ""
        E #1502: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1502: eu escolher o item da lista Meio de pagamento "Boleto"
        E #1502: eu escolher o item da lista Status "001a 002(001a 002RIR 003fornecedor_principal) 003Pendente"
        E #1502: eu clicar no botão Enviar.
    Então #1502: eu vejo um balão informando que é obrigatório selecionar um item para Atendimento.