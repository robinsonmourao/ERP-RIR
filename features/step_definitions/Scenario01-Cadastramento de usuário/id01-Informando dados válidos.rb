Given('que eu esteja na tela de cadastro.') do
  @cadastrar_page = CadastrarPage.new
  @cadastrar_page.load
end

When('eu preencher os campos pertinentes com nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  @cadastrar_page.preencher_dados(nome, password, permissao)
end
And('eu clicar no botão cadastrar.') do
  @cadastrar_page.clicar_cadastrar
end

Then('eu sou redirecionado para dashboard') do
  expect(page).to have_current_path('http://127.0.0.1:3000/dashboard', url: true)
end
And('#0101: '\
    'eu vejo uma mensagem de boas vindas com nome {string}') do |nome|
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Bem-vindo, #{nome}!"
end
