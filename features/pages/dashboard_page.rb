class DashboardPage < SitePrism::Page
  set_url 'http://127.0.0.1:3000/dashboard'

  element :sair_button, '.header-logout-button'

  def clicar_sair
    sair_button.click
  end

  def cursor_hover(selector)
    elemento = find(selector)
    elemento.hover
  end

  def clicar_submenu_link(link)
    find('ul.submenu li a', text: link).click
  end
end
