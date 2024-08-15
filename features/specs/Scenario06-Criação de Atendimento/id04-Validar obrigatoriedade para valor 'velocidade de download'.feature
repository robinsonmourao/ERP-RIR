# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar criar um novo Atendimento no sistema sem informar um valor para 'velocidade de download'.
-Para verificar a obrigatoriedade do campo 'velocidade de download'.

Cenário: Validar obrigatoriedade para valor 'velocidade de download'

    Dado #0604: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0604: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0604: eu tiver passado o mouse sobre a aba Atendimentos
        E #0604: eu tiver clicado em "Novo".
    Quando #0604: eu escolher o item da lista Designação "RIR"
        E #0604: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0604: eu clicar no botão Enviar.
    Então #0604: eu vejo um balão informando que é obrigatório selecionar um item para Fornecedor