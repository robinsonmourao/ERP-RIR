# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar criar um novo Site no sistema sem informar um valor para velocidade contratada.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'velocidade contratada', demais campos válidos

    Dado #2005: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #2005: eu já tenha criado um Cliente previamente
        E #2005: eu tiver passado o mouse sobre a aba Sites
        E #2005: eu tiver clicado em "Novo".
    Quando #2005: eu escolher o item da lista Cliente "cliente_principal"
        E #2005: eu preencher o campo designacao "RIR"
        E #2005: eu preencher o campo nome site "site_principal"
        E #2005: eu clicar no botão Enviar.
    Então #2005: eu vejo um alerta informando que o campo não pode ser vazio.