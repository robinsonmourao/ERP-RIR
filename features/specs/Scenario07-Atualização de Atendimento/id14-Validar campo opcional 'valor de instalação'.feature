# language: pt

@skip
@apagar_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero atualizar um Atendimento no sistema informando um valor para 'valor de instalação'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar campo opcional 'valor de instalação'

    Dado #0714: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0714: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente
        E #0714: eu tiver passado o mouse sobre a aba "Atendimentos"
        E #0714: eu tenha clicado no link "Listar todos"
        E #0714: eu tenha clicado no link Editar do Atendimento criado previamente.
    Quando #0714: eu preencher o campo valor de instalação "150,00"
        E #0714: eu clicar no botão Enviar.
    Então #0714: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados
        E #0714: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.