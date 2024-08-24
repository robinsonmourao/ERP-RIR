import Formulario from './Formulario';

class SetUp{
    cadastrarUsuario (nome, senha, permissao){
        Formulario.preencherCampoPorId("#nome", nome);
        Formulario.preencherCampoPorId("#usuario_password", senha);
        Formulario.escolherItemPorSeletor('select[id=permissao]', permissao);
        Formulario.clicarBotaoPorId('#form-submit-button', 'Cadastrar');

        cy.url().should('eq', 'http://127.0.0.1:3000/dashboard');
    }
}
module.exports = new SetUp();
  