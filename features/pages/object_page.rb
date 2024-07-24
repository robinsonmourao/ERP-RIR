class ObjectPage < SitePrism::Page
  def initialize(entidade)
    self.class.set_url("http://127.0.0.1:3000/#{entidade}/new")
  end

  element :enviar_button, '#form-submit-button'

  def clicar_enviar
    enviar_button.click
    pegar_id_atual
  end

  def selecionar_item(seletor, valor)
    find(seletor).select valor
  end

  def preencher_campo(seletor, valor)
    find(seletor).set valor
  end

  def selecionar_checkbox(seletor, marcado = false)
    checkbox = find(seletor)
    checkbox.set(marcado) unless checkbox.checked? == marcado
  end
  
  def selecionar_radiobutton(selector)
    find(selector).choose
  end
end
