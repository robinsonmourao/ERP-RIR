# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Status no sistema sem informar um valor para o campo 'origem'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade do campo 'origem', demais campos válidos

    Dado #1805: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1805: eu já tenha criado um Site previamente
        E #1805: eu tiver passado o mouse sobre a aba Status
        E #1805: eu tiver clicado em "Novo".
    Quando #1805: eu clicar no botão Enviar.
    Então #1805: eu vejo um balão informando que é obrigatório selecionar um item para origem.