include RunStep

Given('#003003: eu já tenha meu usuário cadastrado com nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  RunStep.cadastrar(nome, password, permissao)
end
And('#003003: que eu esteja na tela entrar.') do
  @entrar_page = EntrarPage.new
  @entrar_page.load
end

When('#003003: eu preencher os campos pertinentes com nome {string} e errar a password {string}') do |nome, password|
  @entrar_page.preencher_dados(nome, password)
end
And('#003003: eu clicar no botão Entrar.') do
  @entrar_page.clicar_entrar
end

Then('#003003: eu vejo uma mensagem informando que a senha está incorreta.') do
  @message = find('.div-notice > div:nth-child(1)')
  expect(@message.text).to eql 'Senha incorreta!'
end
