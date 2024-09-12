# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar uma Fatura no sistema sem informar um valor para o campo 'Meio de pagamento'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Meio de pagamento', demais campos válidos

    Dado #1504: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1504: eu já tenha criado um Atendimento, Status e Fatura previamente
        E #1504: eu tiver passado o mouse sobre a aba "Faturas"
        E #1504: eu tenha clicado no link "Listar todos"
        E #1504: eu tenha clicado no link Editar da Fatura criada previamente.
    Quando #1504: eu escolher o item da lista Atendimentos "001RIR 002fornecedor_principal"        
        E #1504: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1504: eu escolher o item da lista Meio de pagamento ""
        E #1504: eu escolher o item da lista Status "001a 002(001RIR 002fornecedor_principal) 003Pendente"
        E #1504: eu clicar no botão Enviar.
    Então #1504: eu vejo um balão informando que é obrigatório selecionar um item para Meio de pagamento.