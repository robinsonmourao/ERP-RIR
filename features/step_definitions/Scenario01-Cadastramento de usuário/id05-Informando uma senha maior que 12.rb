Given('#0105: que eu esteja na tela de cadastro.') do
  @cadastrar_page = CadastrarPage.new
  @cadastrar_page.load
end

When('#0105: eu preencher os campos pertinentes com nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  @cadastrar_page.preencher_dados(nome, password, permissao)
end
And('#0105: eu clicar no botão cadastrar.') do
  @cadastrar_page.clicar_cadastrar
end

Then('#0105: eu vejo um alerta informando que a senha é muito curta') do
  @message = find('.div-notice > div:nth-child(1)')
  expect(@message.text).to eql 'Senha muito longa! Informe uma senha menor que 12 caracteres.'
end
