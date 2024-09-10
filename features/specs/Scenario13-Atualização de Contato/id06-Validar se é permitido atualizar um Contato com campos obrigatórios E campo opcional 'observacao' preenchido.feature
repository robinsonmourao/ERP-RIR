# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_tabela_principal_ao_terminar
Funcionalidade: Atualização no sistema

-Eu como usuário.
-Quero criar um novo Contato no sistema sem informar um valor para o campo 'Meio de contato'.
-Para verificar a obrigatoriedade do campo.

Cenário: Validar obrigatoriedade para valor 'Meio de contato', demais campos válidos

    Dado #1306: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #1306: eu já tenha criado um Contato previamente
        E #1306: eu tiver passado o mouse sobre a aba "Contatos"
        E #1306: eu tenha clicado no link "Listar todos"
        E #1306: eu tenha clicado no link Editar do Contato criado previamente.
    Quando #1306: eu escolher o item da lista originários "cliente"
        E #1306: eu escolher o item da lista Tipo de contato "Dono"
        E #1306: eu escolher o item da lista Meio de contato "Whatsapp"
        E #1306: eu preencher o campo descrição "00 00000-0000"
        E #1306: eu preencher o campo observação "Observação para testes"
        E #1306: eu clicar no botão Enviar.
    Então #1306: eu sou redirecionado para detalhes do novo Contato criado contendo valores informados
        E #1306: eu vejo a informação de que o Contato foi atualizado com sucesso contendo o valor de contato código composto "00100 00000-0000 002Dono".