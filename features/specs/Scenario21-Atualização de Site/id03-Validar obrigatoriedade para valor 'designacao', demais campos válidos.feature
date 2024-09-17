# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero tentar atualizar um Site no sistema sem informar um valor para designação.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'designacao', demais campos válidos

    Dado #2103: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #2103: eu já tenha criado um Cliente e Site previamente
        E #2103: eu tiver passado o mouse sobre a aba "Sites"
        E #2103: eu tenha clicado no link "Listar todos"
        E #2103: eu tenha clicado no link Editar do Site criado previamente.
    Quando #2103: eu escolher o item da lista Cliente "cliente_principal"
        E #2103: eu preencher o campo designacao ""
        E #2103: eu preencher o campo nome site "site_principal"
        E #2103: eu preencher o campo velocidade contratada "10"
        E #2103: eu clicar no botão Enviar.
    Então #2103: eu vejo um alerta informando que o campo não pode ser vazio.