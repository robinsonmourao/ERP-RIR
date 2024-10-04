# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar atualizar um Atendimento no sistema informando o valor "0" para 'velocidade de upload'.
-Para verificar a permissibilidade do valor "0" no campo 'velocidade de upload'.

Cenário: Validar campo 'velocidade de upload' com valor "0"

    Dado #0710.1: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0710.1: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente
        E #0710.1: eu tiver passado o mouse sobre a aba "Atendimentos"
        E #0710.1: eu tenha clicado no link "Listar todos"
        E #0710.1: eu tenha clicado no link Editar do Atendimento criado previamente.
    Quando #0710.1: eu preencher o campo velocidade de upload "0"
        E #0710.1: eu clicar no botão Enviar.
    Então #0710.1: eu vejo uma mensagem informando que a velocidade de upload deve ser maior que "0"