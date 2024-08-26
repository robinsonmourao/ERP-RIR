import Formulario from '../../support/Formulario'

describe('Cadastrar Usuario', () => {
	describe('Validar se é permitido cadastro de usuário e senha MENOR que 8 caracteres', () => {

		const data = { endpoint: '/cadastrar', nome: 'UsuarioSuper', senha: '1234567', permissao: 'Super' }

		it(`Given que eu esteja na tela de cadastro.`, () => {
			cy.visit(data.endpoint);
		})

		it(`When eu preencher os campos pertinentes com nome ${data.nome}, senha ${data.senha} e permissao ${data.permissao}`, () => {
			Formulario.preencherCampoPorId('#nome', data.nome);
      Formulario.preencherCampoPorId('#usuario_password', data.senha);
			Formulario.selecionarItemPorId('#permissao', data.permissao);
		})

		it(`And eu clicar no botão cadastrar.`, () => {
			Formulario.clicarBotaoPorId('#form-submit-button', 'Cadastrar');
		})

		it(`Then eu vejo um alerta informando que o campo não pode ser vazio.`, () => {
			cy.get('#usuario_password')
				.invoke('prop', 'validationMessage')
				.should('eq', 'O tamanho da senha deve estar entre 8 e 12 caracteres.');
		})
	})
})
