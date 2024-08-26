import Formulario from "../../support/Formulario";

describe(`Cadastrar Usuario`, () => {
	// after(() => { cy.apagarUsuarioAoTerminar(); });
	
	describe(`Validar se é permitido cadastro de usuário escolhendo 'Consulta' da opção de 'permissao'`, () => {
		const data = { endpoint: '/cadastrar', nome: 'UsuarioConsulta', senha: '12345678', permissao: 'Consulta' };
		it(`Given que eu esteja na tela de cadastro.`, () => {
			cy.visit(data.endpoint);
		})

		it(`When eu preencher os campos pertinentes com nome ${data.nome}, password ${data.senha} e permissao ${data.permissao}`, () => {
			Formulario.preencherCampoPorId('#nome', data.nome);
			Formulario.preencherCampoPorId('#usuario_password', data.senha);
			Formulario.selecionarItemPorId('#permissao', data.permissao);
		})

		it(`And eu clicar no botão cadastrar.`, () => {
			Formulario.clicarBotaoPorId('#form-submit-button', 'Cadastrar');
		})

		it(`Then eu sou redirecionado para dashboard`, () => {
			cy.url().should('eq', 'http://127.0.0.1:3000/dashboard');
		})

		it(`And eu vejo uma mensagem de boas vindas com nome ${data.nome}`, () => {
			cy.get('.div-success > div:nth-child(1)').then(($div) => {
				const mensagem = $div.text();
				expect(mensagem).to.eq(`Bem-vindo, ${data.nome}!`);
			});
		})
	})
})
