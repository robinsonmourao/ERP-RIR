# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Cliente no sistema informando um valor para o campo opcional 'inscrição estadual'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido criar um Cliente com campos obrigatórios E campo opcional 'inscrição estadual' preenchido

    Dado #1010: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1010: eu tiver passado o mouse sobre a aba "Clientes"
        E #1010: eu tiver clicado em "Novo".
    Quando #1010: eu preencher o campo nome "cliente_principal"
        E #1010: eu preencher o campo cnpj "XXXXXXXXXXXX01"
        E #1010: eu preencher o campo inscrição estadual "388.108.598.269"
        E #1010: eu clicar no botão Enviar.
    Então #1010: eu sou redirecionado para detalhes do novo Cliente criado contendo valores informados
        E #1010: eu vejo a informação de que o Cliente foi criado com sucesso com o valor de cnpj "Cliente com cnpj 'XXXXXXXXXXXX01' foi criado com sucesso.".