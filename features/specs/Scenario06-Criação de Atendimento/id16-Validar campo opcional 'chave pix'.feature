# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Atendimento no sistema informando um valor para 'chave pix'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar campo opcional 'chave pix'

    Dado #0616: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0616: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0616: eu tiver passado o mouse sobre a aba Atendimentos
        E #0616: eu tiver clicado em "Novo".
    Quando #0616: eu escolher o item da lista Designação "RIR"
        E #0616: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0616: eu preencher o campo velocidade de download "10"
        E #0616: eu preencher o campo chave pix "pix@rir.com.br"
        E #0616: eu clicar no botão Enviar.
    Então #0616: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados
        E #0616: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.