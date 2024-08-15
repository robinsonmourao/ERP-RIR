# language: pt

@skip
@apagar_usuario_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero atualizar um Atendimento no sistema informando o valor 'fixo' para 'Categoria do ip' mas sem informar nada no campo 'ip fixo'.
-Para verificar a obrigatoriedade do campo 'IP fixo' caso a opção 'fixo' esteja selecionada.

Cenário: Validar campo opcional 'Categoria do ip' como 'fixo' sem informar nada no campo 'ip fixo'

    Dado #0722: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0722: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente
        E #0722: eu tiver passado o mouse sobre a aba "Atendimentos"
        E #0722: eu tenha clicado no link "Listar todos"
        E #0722: eu tenha clicado no link Editar do Atendimento criado previamente.
    Quando #0722: eu escolher o botão radial de Categoria do ip fixo
        E #0722: eu clicar no botão Enviar.
    Então #0722: eu vejo um balão informando que é obrigatório preencher o campo IP fixo.