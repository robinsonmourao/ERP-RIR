Given('#004001 '\
      'eu já tenha realizado meu cadastro previamente com '\
      'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  RunStep.cadastrar(nome, password, permissao)
end
And('#004001 eu esteja em qualquer tela dentro do sistema.') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.load
end

When('#004001 eu clicar no botão Sair.') do
  @dashboard_page.clicar_sair
end

Then('#004001 eu sou redirecionado para tela entrar') do
  expect(page).to(satisfy) { |page|
    page.has_current_path?('http://127.0.0.1:3000/', url: true) ||
      page.has_current_path?('http://127.0.0.1:3000/entrar', url: true)
  }
end
And('#004001 eu vejo uma mensagem laranja me informando que fui desconectado!') do
  @message = find('.div-notice > div:nth-child(1)')
  expect(@message.text).to eql 'Você foi desconectado!'
end
