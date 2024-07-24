# language: pt
@skip
@apagar_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar criar um novo Atendimento no sistema informando o valor "0" para 'velocidade de download'.
-Para verificar a permissibilidade d0 valor "0" no campo 'velocidade de download'.

Cenário: Validar campo 'velocidade de download' com valor "0"

    Dado #0605: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0605: eu já tenha criado um Cliente, Site e Fornecedor previamente
        E #0605: eu tiver passado o mouse sobre a aba Atendimentos
        E #0605: eu tiver clicado em "Novo".
    Quando #0605: eu escolher o item da lista Designação "RIR"
        E #0605: eu escolher o item da lista Fornecedor "fornecedor_principal"
        E #0605: eu preencher o campo velocidade de download "0"
        E #0605: eu clicar no botão Enviar.
    Então #0605: eu vejo uma mensagem informando que a velocidade de download deve ser maior que "0"