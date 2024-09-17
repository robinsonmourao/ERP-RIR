# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero tentar atualizar um Site no sistema sem informar um valor para velocidade contratada.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'velocidade contratada', demais campos válidos

    Dado #2105: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #2105: eu já tenha criado um Cliente e Site previamente
        E #2105: eu tiver passado o mouse sobre a aba "Sites"
        E #2105: eu tenha clicado no link "Listar todos"
        E #2105: eu tenha clicado no link Editar do Site criado previamente.
    Quando #2105: eu escolher o item da lista Cliente "cliente_principal"
        E #2105: eu preencher o campo designacao "RIR"
        E #2105: eu preencher o campo nome site "site_principal"
        E #2105: eu preencher o campo velocidade contratada ""
        E #2105: eu clicar no botão Enviar.
    Então #2105: eu vejo um alerta informando que o campo não pode ser vazio.