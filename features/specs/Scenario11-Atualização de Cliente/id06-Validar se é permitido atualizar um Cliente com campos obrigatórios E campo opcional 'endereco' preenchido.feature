# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Cliente no sistema informando um valor para o campo opcional 'endereco'.
-Para validar se o valor está sendo salvo corretamente.

Cenário: Validar se é permitido atualizar um Cliente com campos obrigatórios E campo opcional 'endereco' preenchido

    Dado #1106: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1106: eu já tenha criado um Cliente previamente
        E #1106: eu tiver passado o mouse sobre a aba "Clientes"
        E #1106: eu tenha clicado no link "Listar todos"
        E #1106: eu tenha clicado no link Editar do Cliente criado previamente.
    Quando #1106: eu preencher o campo nome "cliente_alternativo"
        E #1106: eu preencher o campo cnpj "XXXXXXXXXXXX02"
        E #1106: eu preencher o campo endereco "Avenida Alameda das Travessas, nº 111"
        E #1106: eu clicar no botão Enviar.
    Então #1106: eu sou redirecionado para detalhes do Cliente contendo valores atualizados
        E #1106: eu vejo a informação de que o Cliente foi atualizado com sucesso com o valor de cnpj "Cliente com cnpj 'XXXXXXXXXXXX02' foi ATUALIZADO com sucesso.".