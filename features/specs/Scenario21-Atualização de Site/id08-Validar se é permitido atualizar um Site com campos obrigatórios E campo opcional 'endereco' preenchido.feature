# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero tentar atualizar um Site no sistema informando um valor para 'endereco'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido atualizar um Site com campos obrigatórios E campo opcional 'endereco' preenchido

    Dado #2108: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #2108: eu já tenha criado um Cliente e Site previamente
        E #2108: eu tiver passado o mouse sobre a aba "Sites"
        E #2108: eu tenha clicado no link "Listar todos"
        E #2108: eu tenha clicado no link Editar do Site criado previamente.
    Quando #2108: eu preencher o campo endereco "Rua Carlos Machado 133, Barra da Tijuca, Rio de Janeiro"
        E #2108: eu clicar no botão Enviar.
    Então #2108: eu sou redirecionado para detalhes do Site contendo valores atualizados
        E #2108: eu vejo a informação de que o Site foi atualizado com sucesso com o valor de nome do site.