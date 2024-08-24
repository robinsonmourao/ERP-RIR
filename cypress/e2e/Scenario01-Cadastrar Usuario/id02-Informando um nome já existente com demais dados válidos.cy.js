import Formulario from '../../support/Formulario';
import SetUp from '../../support/SetUp';

describe('Cadastrar Usuario', () => {
	after(() => { cy.apagarUsuarioAoTerminar(); });
	
	describe('Validar se é permitido cadastro de usuário com dados válidos', () => {

		const data = { endpoint: '/cadastrar', nome: 'UsuarioSuper', senha: '12345678', permissao: 'Super' }

		it('Given que eu esteja na tela de cadastro', () => {
			cy.visit(data.endpoint);
		})

		it(`And eu já tenha realizado meu cadastro previamente.`, () => {
			SetUp.cadastrarUsuario(data.nome, data.senha, data.permissao);
		})

		it(`When eu acessar novamente a tela de cadastro`, () => {
			cy.visit(data.endpoint);
		})

		it(`And eu preencher os campos pertinentes com MESMO nome ${data.nome} cadastrado anteriormente, password ${data.senha} e permissao ${data.permissao}`, () => {
			Formulario.preencherCampoPorId("#nome", data.nome);
			Formulario.preencherCampoPorId("#usuario_password", data.senha);
			Formulario.escolherItemPorSeletor('select[id=permissao]', data.permissao);
		})
		
		it(`And eu clicar no botão Cadastrar.`, () => {
			Formulario.clicarBotaoPorId('#form-submit-button', 'Cadastrar');
		})

		it(`Then eu vejo que o nome ${data.nome} já está em uso.`, () => {
			cy.get('.div-notice > div:nth-child(1)').then(($div) => {
				const mensagemAtual = $div.text();
				const mensagemEsperada = `Não foi possível salvar Usuario.
                        O nome: '`+data.nome+`' já está em uso OU é inválido!`

				expect(mensagemAtual).to.eq(mensagemEsperada);
			});
		})
	})
})
