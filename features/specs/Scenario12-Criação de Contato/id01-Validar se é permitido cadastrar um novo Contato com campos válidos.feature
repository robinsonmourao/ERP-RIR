# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Contato no sistema.
-Para utilizar seus dados posteriormente.

Cenário: Validar se é permitido cadastrar um novo Contato com campos válidos

    Dado #1201: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1201: eu tiver passado o mouse sobre a aba "Contatos"
        E #1201: eu tiver clicado em "Novo".
    Quando #1201: eu escolher o item da lista originários "cliente"
        E #1201: eu escolher o item da lista Tipo de contato "Dono"
        E #1201: eu escolher o item da lista Meio de contato "Whatsapp"
        E #1201: eu preencher o campo descrição "00 00000-0000"
        E #1201: eu clicar no botão Enviar.
    Então #1201: eu sou redirecionado para detalhes do novo Contato criado contendo valores informados
        E #1201: eu vejo a informação de que o Contato foi criado com sucesso contendo o valor de código contato composto "00100 00000-0000 002Dono".