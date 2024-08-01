include RunStep

Given('que eu esteja na tela de cadastro') do
  @cadastrar_page = CadastrarPage.new
  @cadastrar_page.load
end
And('#0102: '\
    'eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  RunStep.cadastrar(nome, password, permissao)
end

When('eu acessar novamente a tela de cadastro') do
  @cadastrar_page.load
end
And('eu preencher os campos pertinentes com MESMO nome {string} cadastrado anteriormente, '\
     'password {string} e permissao {string}') do |nome, password, permissao|
  @cadastrar_page.preencher_dados(nome, password, permissao)
end
And('eu clicar no botão Cadastrar.') do
  @cadastrar_page.clicar_cadastrar
end

Then('eu vejo que o nome {string} já está em uso.') do |nome|
  expect(page).to have_current_path('http://127.0.0.1:3000/cadastrar', url: true)
  @message = find('.div-notice > div:nth-child(1)')
  expect(@message.text).to eql "Não foi possível salvar Usuario. O nome: '#{nome}' já está em uso OU é inválido!"
end
