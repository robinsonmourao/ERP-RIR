include RunStep

Given('#0501: '\
  'eu já tenha realizado meu cadastro previamente com '\
  'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  RunStep.cadastrar(nome, password, permissao)
end
And('eu esteja na tela de visão geral da conta') do
  @visao_geral_conta_page = VisaoGeralContaPage.new
  @visao_geral_conta_page.load
  @visao_geral_conta_page.clicar_visao_geral_conta
end

When("eu clicar em Fechar minha conta") do
  @visao_geral_conta_page.clicar_deletar_conta_link
end
And("eu preencher o campo com minha atual password {string}.") do |password|
  @visao_geral_conta_page.preencher_dados(password)
  @visao_geral_conta_page.clicar_fechar_conta_button
end

Then('eu sou redirecionado para tela entrar.') do
  expect(page).to have_current_path('http://127.0.0.1:3000/', url: true)
end
And('#0501: eu vejo uma mensagem de confirmação de remoção de conta com nome {string}') do |nome|
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Usuario de nome '#{nome}' foi apagado com sucesso."
end
