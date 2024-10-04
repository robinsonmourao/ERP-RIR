# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Site no sistema.
-Para utilizar seus dados posteriormente.

Cenário: Validar se é permitido atualizar um Site com campos válidos

    Dado #2101: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #2101: eu já tenha criado um Cliente e Site previamente
        E #2101: eu já tenha criado um Cliente com valores alternativos previamente
        E #2101: eu tiver passado o mouse sobre a aba "Sites"
        E #2101: eu tenha clicado no link "Listar todos"
        E #2101: eu tenha clicado no link Editar do Site criado previamente.
    Quando #2101: eu escolher o item da lista Cliente "cliente_alternativo"
        E #2101: eu preencher o campo designacao "RIR2"
        E #2101: eu preencher o campo nome site "site_alternativo"
        E #2101: eu preencher o campo velocidade contratada "20"
        E #2101: eu clicar no botão Enviar.
    Então #2101: eu sou redirecionado para detalhes do Site contendo valores atualizados
        E #2101: eu vejo a informação de que o Site foi atualizado com sucesso com o valor de nome do site.