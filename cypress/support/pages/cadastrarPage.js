class CadastrarPage{
    preencherCampoPorId(id, text){
        cy.get(id).type(text)
    }
	escolherItemPorSeletor(seletor, text){
		cy.get(seletor).select(text); 
	}
	clicarBotao(id, text){
		cy.get(id).contains(text).click();
	}
}
module.exports = new CadastrarPage();
  