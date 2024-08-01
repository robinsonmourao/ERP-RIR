Given('#0302: que eu NÃO possua o usuário cadastrado no sistema') do
end
And('#0302 eu esteja na tela entrar.') do
  @entrar_page = EntrarPage.new
  @entrar_page.load
end

When('#0302 eu preencher os campos pertinentes com nome {string} e password {string}') do |nome, password|
  @entrar_page.preencher_dados(nome, password)
end
And('#0302 eu clicar no botão Entrar.') do
  @entrar_page.clicar_entrar
end

Then('#0302: eu vejo uma mensagem LARANJA informando que usuario com nome {string} não foi encontrado.') do |nome|
  @message = find('.div-notice > div:nth-child(1)')
  expect(@message.text).to eql "Usuário '#{nome}' não encontrado!"
end
