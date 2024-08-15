# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Atendimento no sistema informando um valor para 'Tecnologia do link'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar campo opcional 'Tecnologia do link'

    Dado #0608: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0608: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0608: eu tiver passado o mouse sobre a aba Atendimentos
        E #0608: eu tiver clicado em "Novo".
    Quando #0608: eu escolher o item da lista Designação "RIR"
        E #0608: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0608: eu preencher o campo velocidade de download "10"
        E #0608: eu escolher o item da lista Tecnologia do link "Cabo"
        E #0608: eu clicar no botão Enviar.
    Então #0608: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados
        E #0608: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.