class Formulario {
	static preencherCampoPorId(id, valor) {
	  	cy.get(id).type(valor);
	}
  
	static escolherItemPorSeletor(seletor, valor) {
	  	cy.get(seletor).select(valor);
	}
  
	static clicarBotaoPorId(id, textoEsperado) {
	  	cy.get(id).contains(textoEsperado).click();
	}
}
  
export default Formulario;