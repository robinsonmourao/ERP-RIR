# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Status no sistema relacionado à um Cliente.
-Para utilizar seus dados posteriormente.

Cenário: Validar se é permitido cadastrar um novo Status relacionado à um Cliente com campos válidos

    Dado #1802: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1802: eu já tenha criado um Cliente previamente
        E #1802: eu tiver passado o mouse sobre a aba Status
        E #1802: eu tiver clicado em "Novo".
    Quando #1802: eu escolher o item da Originário "001c 002cliente_principal 003XXXXXXXXXXXX01"
        E #1802: eu clicar no botão Enviar.
    Então #1802: eu sou redirecionado para detalhes do novo Status criado contendo valores informados e valores autopreenchidos
        E #1802: eu vejo a informação de que o Status foi criado com sucesso com o valor de codigo acfs composto.