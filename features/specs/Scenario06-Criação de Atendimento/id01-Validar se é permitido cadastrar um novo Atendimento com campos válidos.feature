# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Atendimento no sistema.
-Para utilizar seus dados posteriormente.

Cenário: Validar se é permitido criar um novo Atendimento com dados válidos

    Dado #0601: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0601: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0601: eu tiver passado o mouse sobre a aba Atendimentos
        E #0601: eu tiver clicado em "Novo".
    Quando #0601: eu escolher o item da lista Designação "RIR"
        E #0601: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0601: eu preencher o campo velocidade de download "10"
        E #0601: eu clicar no botão Enviar.
    Então #0601: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados e valores autopreenchidos
        E #0601: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto.