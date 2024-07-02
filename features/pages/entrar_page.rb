class EntrarPage < SitePrism::Page
  set_url 'http://127.0.0.1:3000/entrar'

  element :nome_text_box, '#nome'
  element :password_text_box, '#password'
  element :entrar_button, '#form-submit-button'

  def preencher_dados(nome, password)
    nome_text_box.set nome
    password_text_box.set password
  end

  def clicar_entrar
    entrar_button.click
  end
end
