# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar criar um novo Site no sistema sem informar um valor para Cliente.
-Para verificar a obrigatoriedade da lista de Cliente.

Cenário: Validar obrigatoriedade para valor 'Cliente'

    Dado #2002: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #2002: eu tiver passado o mouse sobre a aba Sites
        E #2002: eu tiver clicado em "Novo".
    Quando #2002: eu preencher o campo designacao "RIR"
        E #2002: eu preencher o campo nome site "site_principal"
        E #2002: eu preencher o campo velocidade contratada "10"
        E #2002: eu clicar no botão Enviar.
    Então #2002: eu vejo um balão informando que é obrigatório selecionar um item para Cliente