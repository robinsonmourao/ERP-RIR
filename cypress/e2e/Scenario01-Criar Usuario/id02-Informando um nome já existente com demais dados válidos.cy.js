const cadastrarPage = require('../../support/pages/cadastrarPage');
const SetUp = require('../../support/SetUp');

after(() => { cy.apagarUsuarioAoTerminar(); });

describe('Cadastrar Usuário no sistema', () => {
	describe('Validar se é permitido cadastro de usuário com dados válidos', () => {

		const input = { endpoint: '/cadastrar', nome: 'UsuarioSuper', senha: '12345678', permissao: 'Super' }

		it('Given que eu esteja na tela de cadastro', () => {
			cy.visit(input.endpoint);
		})

		it(`And eu já tenha realizado meu cadastro previamente.`, () => {
			SetUp.cadastrarUsuario(input.nome, input.senha, input.permissao);
			cy.url().should('eq', 'http://127.0.0.1:3000/dashboard');
		})

		it(`When eu acessar novamente a tela de cadastro`, () => {
			cy.visit(input.endpoint);
		})

		it(`And eu preencher os campos pertinentes com MESMO nome ${input.nome} cadastrado anteriormente, password ${input.senha} e permissao ${input.permissao}`, () => {
			cadastrarPage.preencherCampoPorId("#nome", input.nome);
			cadastrarPage.preencherCampoPorId("#usuario_password", input.senha);
			cadastrarPage.escolherItemPorSeletor('select[id=permissao]', input.permissao);
		})
		
		it(`And eu clicar no botão Cadastrar.`, () => {
			cadastrarPage.clicarBotaoPorId('#form-submit-button', 'Cadastrar');
		})

		it(`Then eu vejo que o nome {string} já está em uso.`, () => {
			cy.get('.div-notice > div:nth-child(1)').then(($div) => {
				const mensagemAtual = $div.text();
				const mensagemEsperada = `Não foi possível salvar Usuario.
                        O nome: '`+input.nome+`' já está em uso OU é inválido!`

				expect(mensagemAtual).to.eq(mensagemEsperada);
			});
		})
	})
})
