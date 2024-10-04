# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Atendimento no sistema informando o valor 'Backup' para 'Categoria do link'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar campo opcional 'Categoria do link' como 'Backup'

    Dado #0619: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0619: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0619: eu tiver passado o mouse sobre a aba Atendimentos
        E #0619: eu tiver clicado em "Novo".
    Quando #0619: eu escolher o item da lista Designação "RIR"
        E #0619: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0619: eu preencher o campo velocidade de download "10"
        E #0619: eu escolher o botão radial de Categoria do link Backup
        E #0619: eu clicar no botão Enviar.
    Então #0619: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados
        E #0619: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.