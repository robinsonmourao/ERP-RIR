include RunStep

Given('#0502 '\
  'eu já tenha realizado meu cadastro previamente com '\
  'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  RunStep.cadastrar(nome, password, permissao)
end
And('#0502 eu esteja na tela de visão geral da conta.') do
  @visao_geral_conta_page = VisaoGeralContaPage.new
  @visao_geral_conta_page.load
  @visao_geral_conta_page.clicar_visao_geral_conta
end

When("#0502 eu clicar em Fechar minha conta") do
  @visao_geral_conta_page.clicar_deletar_conta_link
end
And("#0502 eu preencha o campo com uma senha incorreta password {string}.") do |password|
  @visao_geral_conta_page.preencher_dados(password)
  @visao_geral_conta_page.clicar_fechar_conta_button
end

Then('#0502 eu vejo uma mensagem dizendo que a senha que informei está incorreta.') do
  @message = find('.div-notice > div:nth-child(1)')
  expect(@message.text).to eql "Senha incorreta!"
end
