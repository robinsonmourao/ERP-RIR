# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Cliente no sistema informando um valor para o campo opcional 'municipio'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido criar um Cliente com campos obrigatórios E campo opcional 'municipio' preenchido

    Dado #1008: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1008: eu já tenha criado um Municipio "Salvador" escolhendo Uf "BA" previamente
        E #1008: eu tiver passado o mouse sobre a aba "Clientes"
        E #1008: eu tiver clicado em "Novo".
    Quando #1008: eu preencher o campo nome "cliente_principal"
        E #1008: eu preencher o campo cnpj "XXXXXXXXXXXX01"
        E #1008: eu escolher o item da lista Municipio "Salvador"
        E #1008: eu clicar no botão Enviar.
    Então #1008: eu sou redirecionado para detalhes do novo Cliente criado contendo valores informados
        E #1008: eu vejo a informação de que o Cliente foi criado com sucesso com o valor de cnpj "Cliente com cnpj 'XXXXXXXXXXXX01' foi criado com sucesso.".