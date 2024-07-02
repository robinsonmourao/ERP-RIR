class CadastrarPage < SitePrism::Page
  set_url 'http://127.0.0.1:3000/cadastrar'

  element :nome_text_box, '#nome'
  element :password_text_box, '#password'
  element :permissao_select, '#permissao'
  element :entrar_button, '#form-submit-button'

  def preencher_dados(nome, password, permissao)
    nome_text_box.set nome
    password_text_box.set password
    permissao_select.select permissao
  end

  def clicar_cadastrar
    entrar_button.click
  end
end
