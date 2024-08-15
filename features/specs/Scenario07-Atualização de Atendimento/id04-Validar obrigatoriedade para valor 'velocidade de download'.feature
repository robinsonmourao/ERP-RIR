# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar atualizar um Atendimento no sistema sem informar um valor para 'velocidade de download'.
-Para verificar a obrigatoriedade do campo 'velocidade de download'.

Cenário: Validar obrigatoriedade para valor 'velocidade de download'

    Dado #0704: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0704: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente
        E #0704: eu tiver passado o mouse sobre a aba "Atendimentos"
        E #0704: eu tenha clicado no link "Listar todos"
        E #0704: eu tenha clicado no link Editar do Atendimento criado previamente.
    Quando #0704: eu preencher o campo velocidade de download ""
        E #0704: eu clicar no botão Enviar.
    Então #0704: eu vejo um balão informando que é obrigatório selecionar um item para Fornecedor