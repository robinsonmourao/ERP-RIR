Given('#0105: que eu esteja na tela de cadastro.') do
  @cadastrar_page = CadastrarPage.new
  @cadastrar_page.load
end

When('#0105: eu preencher os campos pertinentes com nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  @cadastrar_page.preencher_dados(nome, password, permissao)
end
And('#0105: eu clicar no botão cadastrar.') do
  @cadastrar_page.clicar_cadastrar
end

Then('#0105: eu vejo um alerta informando que a senha informada possui o tamanho inadequado.') do
  list = find('#usuario_password', match: :first)
  validation_message = list.native.attribute('validationMessage')
  expect(validation_message).to eq('O tamanho da senha deve estar entre 8 e 12 caracteres.')
end
