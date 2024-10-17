# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_atendimentos_remanscentes_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Status no sistema relacionado à um Cliente.
-Para utilizar seus dados posteriormente.

Cenário: Validar se é permitido atualizar um novo Status relacionado à um Cliente com campos válidos

    Dado #1902: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1902: eu já tenha criado um Cliente e Status previamente
        E #1902: eu já tenha criado um Cliente com valores alternativos
        E #1902: eu tiver passado o mouse sobre a aba Status
        E #1902: eu tenha clicado no link "Listar todos"
        E #1902: eu tenha clicado no link Editar do Status criado previamente.
    Quando #1902: eu escolher o item da Originário "001c 002cliente_alternativo 003XXXXXXXXXXXX02"
        E #1902: eu escolher o item da lista Situação "Ativo"
        E #1902: eu clicar no botão Enviar.
    Então #1902: eu sou redirecionado para detalhes do Status contendo valores atualizados e valores autopreenchidos
        E #1902: eu vejo a informação de que o Status foi atualizado com sucesso com o valor de codigo acfs composto.