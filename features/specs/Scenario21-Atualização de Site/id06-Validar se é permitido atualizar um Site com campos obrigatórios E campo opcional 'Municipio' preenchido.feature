# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero tentar atualizar um Site no sistema informando um valor para 'Municipio'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido atualizar um Site com campos obrigatórios E campo opcional 'Municipio' preenchido

    Dado #2106: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #2106: eu já tenha criado um Cliente e Site previamente
        E #2106: eu já tenha criado um Municipio "Salvador" escolhendo Uf "BA" previamente
        E #2106: eu já tenha criado um Cliente com valores alternativos previamente
        E #2106: eu tiver passado o mouse sobre a aba "Sites"
        E #2106: eu tenha clicado no link "Listar todos"
        E #2106: eu tenha clicado no link Editar do Site criado previamente.
    Quando #2106: eu escolher o item da lista Cliente "cliente_alternativo"
        E #2106: eu preencher o campo designacao "RIR2"
        E #2106: eu preencher o campo nome site "site_alternativo"
        E #2106: eu preencher o campo velocidade contratada "20"
        E #2106: eu escolher o item da lista Municipio "Salvador"
        E #2106: eu clicar no botão Enviar.
    Então #2106: eu sou redirecionado para detalhes do Site contendo valores atualizados
        E #2106: eu vejo a informação de que o Site foi atualizado com sucesso com o valor de nome do site.