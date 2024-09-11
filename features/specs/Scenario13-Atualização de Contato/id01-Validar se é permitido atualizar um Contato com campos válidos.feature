# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Atualização no sistema

-Eu como usuário.
-Quero atualizar um Contato no sistema.
-Para corrigir algum dado inserido incorretamente na criação.

Cenário: Validar se é permitido atualizar um Contato com campos válidos

    Dado #1301: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1301: eu já tenha criado um Contato previamente
        E #1301: eu tiver passado o mouse sobre a aba "Contatos"
        E #1301: eu tenha clicado no link "Listar todos"
        E #1301: eu tenha clicado no link Editar do Contato criado previamente.
    Quando #1301: eu escolher o item da lista originários "cliente"
        E #1301: eu escolher o item da lista Tipo de contato "Dono"
        E #1301: eu escolher o item da lista Meio de contato "Whatsapp"
        E #1301: eu preencher o campo descrição "00 00000-0000"
        E #1301: eu clicar no botão Enviar.
    Então #1301: eu sou redirecionado para detalhes do novo Contato criado contendo valores informados
        E #1301: eu vejo a informação de que o Contato foi atualizado com sucesso contendo o valor de código contato composto "00100 00000-0000 002Dono".