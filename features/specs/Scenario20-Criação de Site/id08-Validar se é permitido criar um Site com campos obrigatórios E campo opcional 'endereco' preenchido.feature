# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar criar um novo Site no sistema informando um valor para 'endereco'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido criar um Site com campos obrigatórios E campo opcional 'endereco' preenchido

    Dado #2008: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #2008: eu já tenha criado um Cliente previamente
        E #2008: eu tiver passado o mouse sobre a aba Sites
        E #2008: eu tiver clicado em "Novo".
    Quando #2008: eu escolher o item da lista Cliente "cliente_principal"
        E #2008: eu preencher o campo designacao "RIR"
        E #2008: eu preencher o campo nome site "site_principal"
        E #2008: eu preencher o campo velocidade contratada "10"
        E #2008: eu preencher o campo endereco "Rua Carlos Machado 133, Barra da Tijuca, Rio de Janeiro"
        E #2008: eu clicar no botão Enviar.
    Então #2008: eu sou redirecionado para detalhes do novo Site criado contendo valores informados
        E #2008: eu vejo a informação de que o Site foi criado com sucesso com o valor de nome do site.