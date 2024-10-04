# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Cliente no sistema.
-Para corrigir algum dado inserido incorretamente na criação.

Cenário: Validar se é permitido atualizar um Cliente com campos válidos

    Dado #1101: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1101: eu já tenha criado um Cliente previamente
        E #1101: eu tiver passado o mouse sobre a aba "Clientes"
        E #1101: eu tenha clicado no link "Listar todos"
        E #1101: eu tenha clicado no link Editar do Cliente criado previamente.
    Quando #1101: eu preencher o campo nome "cliente_alternativo"
        E #1101: eu preencher o campo cnpj "XXXXXXXXXXXX02"
        E #1101: eu clicar no botão Enviar.
    Então #1101: eu sou redirecionado para detalhes do Cliente contendo valores atualizados
        E #1101: eu vejo a informação de que o Cliente foi atualizado com sucesso com o valor de cnpj "Cliente com cnpj 'XXXXXXXXXXXX02' foi ATUALIZADO com sucesso.".