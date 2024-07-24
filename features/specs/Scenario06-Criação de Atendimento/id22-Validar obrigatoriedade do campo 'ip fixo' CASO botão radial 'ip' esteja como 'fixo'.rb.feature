# language: pt
@skip
@apagar_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero criar um novo Atendimento no sistema informando o valor 'fixo' para 'Categoria do ip' mas sem informar nada no campo 'ip fixo'.
-Para verificar a obrigatoriedade do campo 'IP fixo' caso a opção 'fixo' esteja selecionada.

Cenário: Validar campo opcional 'Categoria do ip' como 'fixo' sem informar nada no campo 'ip fixo'

    Dado #0622: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0622: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0622: eu tiver passado o mouse sobre a aba Atendimentos
        E #0622: eu tiver clicado em "Novo".
    Quando #0622: eu escolher o item da lista Designação "RIR"
        E #0622: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0622: eu preencher o campo velocidade de download "10"
        E #0622: eu escolher o botão radial de Categoria do ip fixo
        E #0622: eu clicar no botão Enviar.
    Então #0622: eu vejo um balão informando que é obrigatório preencher o campo IP fixo.