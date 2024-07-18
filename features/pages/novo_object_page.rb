class NovoObjectPage < SitePrism::Page
  def initialize(entidade)
    self.class.set_url("http://127.0.0.1:3000/#{entidade}/new")
  end

  element :enviar_button, '#form-submit-button'

  def clicar_enviar
    enviar_button.click
  end

  def selecionar_item(seletor, valor)
    find(seletor).select valor
  end

  def preencher_campo(seletor, valor)
    find(seletor).set valor
  end
end
