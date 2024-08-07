# language: pt

@skip
@apagar_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar criar um novo Atendimento no sistema informando o valor menor que "0" para 'velocidade de upload'.
-Para verificar a permissibilidade do valor "0" no campo 'velocidade de upload'.

Cenário: Validar campo 'velocidade de upload' com valor menor que "0"

    Dado #0610.2: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0610.2: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0610.2: eu tiver passado o mouse sobre a aba Atendimentos
        E #0610.2: eu tiver clicado em "Novo".
    Quando #0610.2: eu escolher o item da lista Designação "RIR"
        E #0610.2: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0610.2: eu preencher o campo velocidade de download "100"
        E #0610.2: eu preencher o campo velocidade de upload "-1"
        E #0610.2: eu clicar no botão Enviar.
    Então #0610.2: eu vejo uma mensagem informando que a velocidade de upload deve ser maior que "0"