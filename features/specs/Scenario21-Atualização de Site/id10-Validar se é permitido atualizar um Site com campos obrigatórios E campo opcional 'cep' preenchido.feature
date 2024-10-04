# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero tentar atualizar um Site no sistema informando um valor para 'cep'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido atualizar um Site com campos obrigatórios E campo opcional 'cep' preenchido

    Dado #2110: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #2110: eu já tenha criado um Cliente e Site previamente
        E #2110: eu tiver passado o mouse sobre a aba "Sites"
        E #2110: eu tenha clicado no link "Listar todos"
        E #2110: eu tenha clicado no link Editar do Site criado previamente.
    Quando #2110: eu preencher o campo cep "22775042"
        E #2110: eu clicar no botão Enviar.
    Então #2110: eu sou redirecionado para detalhes do Site contendo valores atualizados
        E #2110: eu vejo a informação de que o Site foi atualizado com sucesso com o valor de nome do site.