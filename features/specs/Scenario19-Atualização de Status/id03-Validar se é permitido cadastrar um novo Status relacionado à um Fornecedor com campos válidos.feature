# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Status no sistema relacionado à um Fornecedor.
-Para utilizar seus dados posteriormente.

Cenário: Validar se é permitido atualizar um novo Status relacionado à um Fornecedor com campos válidos

    Dado #1903: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1903: eu já tenha criado um Fornecedor e Status previamente
        E #1903: eu já tenha criado um Fornecedor com valores alternativos
        E #1903: eu tiver passado o mouse sobre a aba Status
        E #1903: eu tenha clicado no link "Listar todos"
        E #1903: eu tenha clicado no link Editar do Status criado previamente.
    Quando #1903: eu escolher o item da Originário "001f 002fornecedor_alternativo"
        E #1903: eu clicar no botão Enviar.
    Então #1903: eu sou redirecionado para detalhes do Status contendo valores atualizados e valores autopreenchidos
        E #1903: eu vejo a informação de que o Status foi atualizado com sucesso com o valor de codigo acfs composto.