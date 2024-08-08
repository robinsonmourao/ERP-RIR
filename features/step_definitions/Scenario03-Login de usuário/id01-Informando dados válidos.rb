include SetUp

Given('#0301: '\
      'eu já tenha realizado meu cadastro previamente com '\
      'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end
And('eu esteja na tela de entrar') do
  @entrar_page = EntrarPage.new
  @entrar_page.load
end

When('eu preencher os campos pertinentes com MESMO nome {string} e '\
     'password {string} cadastrados anteriormente') do |nome, password|
  @entrar_page.preencher_dados(nome, password)
end
And('eu clicar no botão Entrar') do
  @entrar_page.clicar_entrar
end

Then('eu sou redirecionado para dashboard.') do
  expect(page).to have_current_path('http://127.0.0.1:3000/dashboard', url: true)
end
And('#0301: '\
    'eu vejo uma mensagem de boas vindas com nome {string}') do |nome|
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Bem-vindo, #{nome}!"
end
