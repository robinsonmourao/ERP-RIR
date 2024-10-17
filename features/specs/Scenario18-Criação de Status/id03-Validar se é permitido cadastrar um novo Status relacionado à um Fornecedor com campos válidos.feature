# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_atendimentos_remanscentes_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Status no sistema relacionado à um Fornecedor.
-Para utilizar seus dados posteriormente.

Cenário: Validar se é permitido cadastrar um novo Status relacionado à um Fornecedor com campos válidos

    Dado #1803: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1803: eu já tenha criado um Fornecedor previamente
        E #1803: eu tiver passado o mouse sobre a aba Status
        E #1803: eu tiver clicado em "Novo".
    Quando #1803: eu escolher o item da Originário "001f 002fornecedor_principal"
        E #1803: eu clicar no botão Enviar.
    Então #1803: eu sou redirecionado para detalhes do novo Status criado contendo valores informados e valores autopreenchidos
        E #1803: eu vejo a informação de que o Status foi criado com sucesso com o valor de codigo acfs composto.