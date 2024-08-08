class ObjectPage < SitePrism::Page
  def initialize(entidade)
    self.class.set_url("http://127.0.0.1:3000/#{entidade}/new")
  end

  element :enviar_button, '#form-submit-button'

  def clicar_enviar
    enviar_button.click
    capture_id_by_link
  end

  def selecionar_item(seletor, valor)
    if valor.nil? || valor.empty?
      selecionar_primeira_opcao(seletor)
    else
      find(seletor).select(valor)
    end
  end

  def selecionar_primeira_opcao(seletor)
    find(seletor).find('option', match: :first).select_option
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
