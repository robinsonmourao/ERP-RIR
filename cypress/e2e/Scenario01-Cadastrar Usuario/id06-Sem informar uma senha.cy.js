import Formulario from '../../support/Formulario'

describe('Cadastrar Usuario', () => {
	describe('Validar se é permitido cadastro de usuário sem informar o campo nome', () => {

		const data = { endpoint: '/cadastrar', nome: 'UsuarioSuper', permissao: 'Super' }

		it(`Given que eu esteja na tela de cadastro.`, () => {
			cy.visit(data.endpoint);
		})

		it(`When eu preencher os campos pertinentes com nome ${data.nome} e permissao ${data.permissao}`, () => {
			Formulario.preencherCampoPorId('#nome', data.nome);
			Formulario.escolherItemPorSeletor('#permissao', data.permissao);
		})

		it(`And eu clicar no botão cadastrar.`, () => {
			Formulario.clicarBotaoPorId('#form-submit-button', 'Cadastrar');
		})

		it(`Then eu vejo um alerta informando que o campo não pode ser vazio.`, () => {
			cy.get('#usuario_password')
				.invoke('prop', 'validationMessage')
				.should('eq', 'Preencha este campo.');
		})
	})
})
