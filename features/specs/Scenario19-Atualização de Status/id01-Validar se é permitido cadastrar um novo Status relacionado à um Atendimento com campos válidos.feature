# language: pt

@skip
@apagar_usuario_ao_terminar
@apagar_ultima_tabela_criada_ao_terminar
Funcionalidade: Atualizar no sistema

-Eu como usuário.
-Quero atualizar um Status no sistema relacionado à um Atendimento.
-Para utilizar seus dados posteriormente.

Cenário: Validar se é permitido atualizar um Status relacionado à um Atendimento com campos válidos

    Dado #1901: eu já tenha realizado meu cadastro previamente com nome "UsuarioSuper", password "12345678" e permissao "Super"
			E #1901: eu já tenha criado um Atendimento e Status previamente
			E #1901: eu já tenha criado um Atendimento com valores alternativos
			E #1901: eu tiver passado o mouse sobre a aba Status
			E #1901: eu tenha clicado no link "Listar todos"
			E #1901: eu tenha clicado no link Editar do Status criado previamente.
	Quando #1901: eu escolher o item da Originário "001a 002RIR2 003fornecedor_alternativo"
        E #1901: eu clicar no botão Enviar.
    Então #1901: eu sou redirecionado para detalhes do Status contendo valores atualizados e valores autopreenchidos
        E #1901: eu vejo a informação de que o Status foi atualizado com sucesso com o valor de codigo acfs composto.