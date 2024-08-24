import Formulario from "../../support/Formulario";

describe(`Cadastrar Usuario`, () => {
	describe(`Validar se é permitido cadastro sem selecionar nenhuma opção para permissao`, () => {
		const data = { endpoint: '/cadastrar', nome: 'UsuarioSuper', senha: '12345678' };
		it(`Given que eu esteja na tela de cadastro.`, () => {
			cy.visit(data.endpoint);
		})

		it(`When eu preencher os campos pertinentes com nome ${data.nome} e password ${data.senha}`, () => {
			Formulario.preencherCampoPorId('#nome', data.nome);
			Formulario.preencherCampoPorId('#usuario_password', data.senha);
		})

		it(`And eu clicar no botão cadastrar.`, () => {
			Formulario.clicarBotaoPorId('#form-submit-button', 'Cadastrar');
		})

		it(`And eu vejo uma mensagem de boas vindas com nome ${data.nome}`, () => {
			cy.get('#permissao')
				.invoke('prop', 'validationMessage')
				.should('eq', 'Selecione um item da lista.');
		})
	})
})
