# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar uma nova Fatura no sistema sem informar um valor para o campo 'origem'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Atendimento', demais campos válidos

    Dado #1402: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1402: eu já tenha criado um Status previamente
        E #1402: eu tiver passado o mouse sobre a aba "Faturas"
        E #1402: eu tiver clicado em "Novo".
    Quando #1402: eu escolher o item da lista Grupos "Fatura não agrupada"
        E #1402: eu escolher o item da lista Meio de pagamento "Boleto"
        E #1402: eu escolher o item da lista Status "001a 002(001RIR 002fornecedor_principal) 003Pendente"
        E #1402: eu clicar no botão Enviar.
    Então #1402: eu vejo um balão informando que é obrigatório selecionar um item para Atendimento.