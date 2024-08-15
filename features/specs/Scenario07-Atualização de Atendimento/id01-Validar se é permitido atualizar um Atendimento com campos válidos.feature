# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero atualizar um Atendimento no sistema.
-Para corrigir algum dado inserido incorretamente na criação.

Cenário: Validar se é permitido atualizar um Atendimento com dados válidos

    Dado #0701: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0701: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente
        E #0701: eu já tenha criado um Cliente, Site, Fornecedor com valores alternativos
        E #0701: eu tiver passado o mouse sobre a aba "Atendimentos"
        E #0701: eu tenha clicado no link "Listar todos"
        E #0701: eu tenha clicado no link Editar do Atendimento criado previamente.
    Quando #0701: eu escolher o item da lista Designação "RIR2"
        E #0701: eu escolher o item da lista Fornecedor "fornecedor_alternativo"
        E #0701: eu preencher o campo velocidade de download "20"
        E #0701: eu clicar no botão Enviar.
    Então #0701: eu sou redirecionado para detalhes do Atendimento contendo valores atualizados e autopreenchidos
        E #0701: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto.