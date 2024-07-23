Given('#0111: que eu esteja na tela de cadastro.') do
  @cadastrar_page = CadastrarPage.new
  @cadastrar_page.load
end

When('#0111: eu preencher os campos pertinentes com nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  @cadastrar_page.preencher_dados(nome, password, permissao)
end
And('#0111: eu clicar no botão cadastrar.') do
  @cadastrar_page.clicar_cadastrar
end

Then('#0111: eu vejo um alerta informando é necessário selecionar um item da lista') do
  list = find("#permissao", match: :first)
  validation_message = list.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end
