# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_objetos_remanscentes_de_atendimento
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero atualizar um Atendimento no sistema marcando a caixa 'acompanha nota fiscal'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar campo opcional 'acompanha nota fiscal' como habilitada

    Dado #0726: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0726: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente
        E #0726: eu tiver passado o mouse sobre a aba "Atendimentos"
        E #0726: eu tenha clicado no link "Listar todos"
        E #0726: eu tenha clicado no link Editar do Atendimento criado previamente.
    Quando #0726: eu selecione a caixa de seleção acompanha nota fiscal como habilitada
        E #0726: eu clicar no botão Enviar.
    Então #0726: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados
        E #0726: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.