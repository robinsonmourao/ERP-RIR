# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar criar um novo Atendimento no sistema sem informar um valor para Site.
-Para verificar a obrigatoriedade da lista de Site.

Cenário: Validar obrigatoriedade para valor 'Site'

    Dado #0602: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0602: eu já tenha criado um Fornecedor previamente
        E #0602: eu tiver passado o mouse sobre a aba Atendimentos
        E #0602: eu tiver clicado em "Novo".
    Quando #0602: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0602: eu preencher o campo velocidade de download "10"
        E #0602: eu clicar no botão Enviar.
    Então #0602: eu vejo um balão informando que é obrigatório selecionar um item para Site