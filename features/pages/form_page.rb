class FormPage < SitePrism::Page
  def initialize(entidade)
    self.class.set_url("http://127.0.0.1:3000/#{entidade}/new")
  end

  element :enviar_button, '#form-submit-button'
  element :enviar_button_form_auxiliar, '#high-privileges-form-submit-button'

  def clicar_enviar
    enviar_button.click
    capture_id_by_link
  end

  def clicar_enviar_form_auxiliar
    enviar_button_form_auxiliar.click
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

  def preencher_data(day_id, month_id, year_id, data_vencimento_value, page)
    data_formatada = Date.strptime(data_vencimento_value, '%Y-%m-%d')
    if data_formatada
      templates = {
        1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June',
        7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December'
      }
      month = templates[data_formatada.month] || []
      year = data_formatada.year
      day = data_formatada.day

      page.selecionar_item(year_id, year.to_s)
      page.selecionar_item(month_id, month.to_s)
      page.selecionar_item(day_id, day.to_s)
    end
  rescue
    puts 'Falha ao fazer parse de data!'
  end
end
