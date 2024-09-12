# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar uma nova Fatura no sistema sem informar um valor para o campo 'Status'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Status', demais campos válidos

    Dado #1405: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1405: eu já tenha criado um Atendimento previamente
        E #1405: eu tiver passado o mouse sobre a aba "Faturas"
        E #1405: eu tiver clicado em "Novo".
    Quando #1405: eu escolher o item da lista Atendimentos "001RIR 002fornecedor_principal"        
        E #1405: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1405: eu escolher o item da lista Meio de pagamento "Boleto"
        E #1405: eu clicar no botão Enviar.
    Então #1405: eu vejo um balão informando que é obrigatório selecionar um item para Status.