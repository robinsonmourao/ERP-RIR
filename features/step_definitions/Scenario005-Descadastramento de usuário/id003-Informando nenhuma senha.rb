include RunStep

Given('#005003 '\
  'eu já tenha realizado meu cadastro previamente com '\
  'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  RunStep.cadastrar(nome, password, permissao)
end
And('#005003 eu esteja na tela de visão geral da conta.') do
  @visao_geral_conta_page = VisaoGeralContaPage.new
  @visao_geral_conta_page.load
  @visao_geral_conta_page.clicar_visao_geral_conta
end

When("#005003 eu clicar em Fechar minha conta") do
  @visao_geral_conta_page.clicar_deletar_conta_link
end
And("#005003 eu preencha o campo com uma senha incorreta password {string}.") do |password|
  @visao_geral_conta_page.preencher_dados(password)
  @visao_geral_conta_page.clicar_fechar_conta_button
end

Then('#005003 eu vejo um alerta dizendo que é necessário preencher o campo senha.') do
  password_confirmation_field = find('#usuario_senha_atual')
  expect(password_confirmation_field.text).to eql ''
end
