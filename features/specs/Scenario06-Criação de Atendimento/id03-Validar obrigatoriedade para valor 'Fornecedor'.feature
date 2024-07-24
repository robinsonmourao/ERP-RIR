# language: pt
@skip
@apagar_ao_terminar
Funcionalidade: Criar no sistema

-Eu como usuário.
-Quero tentar criar um novo Atendimento no sistema sem informar um valor para Site.
-Para verificar a obrigatoriedade da lista de Site.

Cenário: Validar obrigatoriedade para valor 'Site'

    Dado #0603: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
        E #0603: eu já tenha criado um Cliente e Site previamente
        E #0603: eu tiver passado o mouse sobre a aba Atendimentos
        E #0603: eu tiver clicado em "Novo".
    Quando #0603: eu escolher o item da lista Site "RIR"
        E #0603: eu preencher o campo velocidade de download "10"
        E #0603: eu clicar no botão Enviar.
    Então #0603: eu vejo um balão informando que é obrigatório selecionar um item para Fornecedor