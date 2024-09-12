# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Contato no sistema sem informar um valor para o campo 'observacao'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar se é permitido criar um Contato com campos obrigatórios E campo opcional 'observacao' preenchido

    Dado #1206: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1206: eu tiver passado o mouse sobre a aba "Contatos"
        E #1206: eu tiver clicado em "Novo".
    Quando #1206: eu escolher o item da lista originários "cliente"
        E #1206: eu escolher o item da lista Tipo de contato "Dono"
        E #1206: eu escolher o item da lista Meio de contato "Whatsapp"
        E #1206: eu preencher o campo descrição "00 00000-0000"
        E #1206: eu preencher o campo observação "Observação para testes"
        E #1206: eu clicar no botão Enviar.
    Então #1206: eu sou redirecionado para detalhes do novo Contato criado contendo valores informados
        E #1206: eu vejo a informação de que o Contato foi criado com sucesso contendo o valor de código contato composto "00100 00000-0000 002Dono".