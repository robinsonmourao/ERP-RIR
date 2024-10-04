# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar atualizar um Atendimento no sistema sem informar um valor para Site.
-Para verificar a obrigatoriedade da lista de Site.

Cenário: Validar obrigatoriedade para valor 'Site'

    Dado #0702: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0702: eu já tenha criado um Fornecedor e Atendimento previamente
        E #0702: eu tiver passado o mouse sobre a aba "Atendimentos"
        E #0702: eu tenha clicado no link "Listar todos"
        E #0702: eu tenha clicado no link Editar do Atendimento criado previamente.
    Quando #0702: eu escolher o item da lista Designação ""
        E #0702: eu clicar no botão Enviar.
    Então #0702: eu vejo um balão informando que é obrigatório selecionar um item para Site