class DashboardPage < SitePrism::Page
  set_url 'http://127.0.0.1:3000/dashboard'

  element :sair_button, '.header-logout-button'

  def clicar_sair
    sair_button.click
  end
end
