# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Status no sistema relacionado à um Site.
-Para utilizar seus dados posteriormente.

Cenário: Validar se é permitido atualizar um novo Status relacionado à um Site com campos válidos

    Dado #1904: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1904: eu já tenha criado um Site e Status previamente
        E #1904: eu já tenha criado um Site com valores alternativos
        E #1904: eu tiver passado o mouse sobre a aba Status
        E #1904: eu tenha clicado no link "Listar todos"
        E #1904: eu tenha clicado no link Editar do Status criado previamente.
    Quando #1904: eu escolher o item da Originário "001s 002site_alternativo 003RIR2"
        E #1904: eu clicar no botão Enviar.
    Então #1904: eu sou redirecionado para detalhes do Status contendo valores atualizados e valores autopreenchidos
        E #1904: eu vejo a informação de que o Status foi atualizado com sucesso com o valor de codigo acfs composto.