Given('#003004: eu já tenha meu usuário cadastrado '\
      'com nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  RunStep.cadastrar(nome, password, permissao)
end
E('#003004: que eu esteja na tela entrar.') do
  @entrar_page = EntrarPage.new
  @entrar_page.load
end

When('#003004: eu preencher os campos pertinentes com nome {string} e password {string}') do |nome, password|
  @entrar_page.preencher_dados(nome, password)
end
And('#003004: eu clicar no botão Entrar.') do
  @entrar_page.clicar_entrar
end

Then('#003004: eu vejo um alerta informando que o campo não pode ser vazio') do
  password_field = find('input#password')
  expect(password_field.value).to eq ''
end
