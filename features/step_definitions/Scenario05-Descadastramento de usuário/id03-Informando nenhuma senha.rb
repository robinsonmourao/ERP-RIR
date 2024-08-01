include RunStep

Given('#0503 '\
  'eu já tenha realizado meu cadastro previamente com '\
  'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  RunStep.cadastrar(nome, password, permissao)
end
And('#0503 eu esteja na tela de visão geral da conta.') do
  @visao_geral_conta_page = VisaoGeralContaPage.new
  @visao_geral_conta_page.load
  @visao_geral_conta_page.clicar_visao_geral_conta
end

When("#0503 eu clicar em Fechar minha conta") do
  @visao_geral_conta_page.clicar_deletar_conta_link
end
And("#0503 eu preencha o campo com uma senha incorreta password {string}.") do |password|
  @visao_geral_conta_page.preencher_dados(password)
  @visao_geral_conta_page.clicar_fechar_conta_button
end

Then('#0503 eu vejo um alerta dizendo que é necessário preencher o campo senha.') do
  field = find("#usuario_senha_atual")
  validation_message = field.native.attribute('validationMessage')
  expect(validation_message).to eq('Preencha este campo.')
end
