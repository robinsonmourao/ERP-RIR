# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar atualizar um Atendimento no sistema informando o valor "0" para 'velocidade de download'.
-Para verificar a permissibilidade d0 valor "0" no campo 'velocidade de download'.

Cenário: Validar campo 'velocidade de download' com valor "0"

    Dado #0705: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0705: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente
        E #0705: eu tiver passado o mouse sobre a aba "Atendimentos"
        E #0705: eu tenha clicado no link "Listar todos"
        E #0705: eu tenha clicado no link Editar do Atendimento criado previamente.
    Quando #0705: eu preencher o campo velocidade de download "0"
        E #0705: eu clicar no botão Enviar.
    Então #0705: eu vejo uma mensagem informando que a velocidade de download deve ser maior que "0"