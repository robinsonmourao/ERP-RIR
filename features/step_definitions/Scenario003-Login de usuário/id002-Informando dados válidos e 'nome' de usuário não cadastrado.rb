Given('#003002: que eu NÃO possua o usuário cadastrado no sistema') do
end
And('#003002 eu esteja na tela entrar.') do
  @entrar_page = EntrarPage.new
  @entrar_page.load
end

When('#003002 eu preencher os campos pertinentes com nome {string} e '\
     'password {string} cadastrados anteriormente') do |nome, password|
  @entrar_page.preencher_dados(nome, password)
end
And('#003002 eu clicar no botão Entrar.') do
  @entrar_page.clicar_entrar
end

Then('#003002: eu vejo uma mensagem LARANJA informando que usuario com nome {string} não foi encontrado.') do |nome|
  @message = find('.div-notice > div:nth-child(1)')
  expect(@message.text).to eql "Usuário '#{nome}' não encontrado!"
end
