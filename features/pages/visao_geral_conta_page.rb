class VisaoGeralContaPage < SitePrism::Page
  set_url 'http://127.0.0.1:3000/dashboard'

  element :visao_geral_conta_button, '.header-settings-button'
  element :deletar_conta_link, 'a.close-account-link-autohide'
  element :fechar_conta_button, '#close-account-form-submit-button'
  element :password_text_box, '#usuario_senha_atual'

  def clicar_visao_geral_conta
    visao_geral_conta_button.click
  end

  def clicar_deletar_conta_link
    deletar_conta_link.click
  end

  def preencher_dados(password)
    password_text_box.set password
  end

  def clicar_fechar_conta
    fechar_conta_button.click
  end
end
