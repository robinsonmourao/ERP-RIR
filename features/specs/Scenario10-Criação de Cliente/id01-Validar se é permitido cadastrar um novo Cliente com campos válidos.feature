# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Cliente no sistema.
-Para utilizar seus dados posteriormente.

Cenário: Validar se é permitido cadastrar um novo Cliente com campos válidos

    Dado #1001: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1001: eu tiver passado o mouse sobre a aba "Clientes"
        E #1001: eu tiver clicado em "Novo".
    Quando #1001: eu preencher o campo nome "cliente_principal"
        E #1001: eu preencher o campo cnpj "XXXXXXXXXXXX01"
        E #1001: eu clicar no botão Enviar.
    Então #1001: eu sou redirecionado para detalhes do novo Cliente criado contendo valores informados
        E #1001: eu vejo a informação de que o Cliente foi criado com sucesso com o valor de cnpj "Cliente com cnpj 'XXXXXXXXXXXX01' foi criado com sucesso.".