# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero tentar atualizar um Site no sistema sem informar um valor para Cliente.
-Para verificar a obrigatoriedade da lista de Cliente.

Cenário: Validar obrigatoriedade para valor 'Cliente'

    Dado #2102: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #2102: eu já tenha criado um Site previamente
        E #2102: eu tiver passado o mouse sobre a aba "Sites"
        E #2102: eu tenha clicado no link "Listar todos"
        E #2102: eu tenha clicado no link Editar do Site criado previamente.
    Quando #2102: eu escolher o item da lista Cliente ""
        E #2102: eu preencher o campo designacao "RIR2"
        E #2102: eu preencher o campo nome site "site_alternativo"
        E #2102: eu preencher o campo velocidade contratada "20"
        E #2102: eu clicar no botão Enviar.
    Então #2102: eu vejo um balão informando que é obrigatório selecionar um item para Cliente