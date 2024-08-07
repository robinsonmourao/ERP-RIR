# language: pt

@skip
@apagar_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar atualizar um Atendimento no sistema sem informar um valor para Fornecedor.
-Para verificar a obrigatoriedade da lista de Fornecedor.

Cenário: Validar obrigatoriedade para valor 'Fornecedor'

    Dado #0703: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0703: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente
        E #0703: eu tiver passado o mouse sobre a aba Atendimentos
        E #0703: eu tenha clicado no link "Listar todos"
        E #0703: eu tenha clicado no link Editar do Atendimento criado previamente.
    Quando #0703: eu escolher o item da lista Fornecedor ""
        E #0703: eu clicar no botão Enviar.
    Então #0703: eu vejo um balão informando que é obrigatório selecionar um item para Fornecedor