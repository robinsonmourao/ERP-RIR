const cadastrarPage = require('../support/pages/cadastrarPage');

describe('Cadastrar no sistema', () => {
	describe('Validar se é permitido cadastro de usuário com dados válidos', () => {
		const input = {
			endpoint: '/cadastrar',
			nome: 'UsuarioSuper',
			senha: '12345678',
			permissao: 'Super'
		}
		// before(() => {
		// 	execSync('node scripts/wipeDB.js');
		// });

		it('que eu esteja na tela de cadastro.', () => {
			cy.visit(input.endpoint)
		})
		it(`When eu preencher os campos pertinentes com nome "${input.nome}", password "${input.senha}" e permissao "${input.permissao}"`, () => {
			cadastrarPage.preencherCampoPorId("#nome", input.nome)
			cadastrarPage.preencherCampoPorId("#usuario_password", input.senha);
			cadastrarPage.escolherItemPorSeletor('select[id=permissao]', input.permissao);
		})
		it(`And eu clicar no botão cadastrar.`, () => {
			cadastrarPage.clicarBotao('#form-submit-button', 'Cadastrar');
		})
		it(`Then eu sou redirecionado para dashboard`, () => {
			cy.url().should('eq', 'http://127.0.0.1:3000/dashboard');
		})
		it(`And eu vejo uma mensagem de boas vindas com nome "UsuarioSuper"`, () => {
			cy.get('.div-success > div:nth-child(1)').then(($div) => {
				const mensagem = $div.text();
				expect(mensagem).to.eq('Bem-vindo, UsuarioSuper!');
			});
		})
	})
})
