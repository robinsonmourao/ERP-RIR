const cadastrarPage = require('../support/pages/cadastrarPage');

class SetUp{
    cadastrarUsuario (nome, senha, permissao){
        cadastrarPage.preencherCampoPorId("#nome", nome);
        cadastrarPage.preencherCampoPorId("#usuario_password", senha);
        cadastrarPage.escolherItemPorSeletor('select[id=permissao]', permissao);
        cadastrarPage.clicarBotaoPorId('#form-submit-button', 'Cadastrar');
    }
}
module.exports = new SetUp();
  