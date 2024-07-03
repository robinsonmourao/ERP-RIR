Given('#001011: que eu esteja na tela de cadastro.') do
  @cadastrar_page = CadastrarPage.new
  @cadastrar_page.load
end

When('#001011: eu preencher os campos pertinentes com nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  @cadastrar_page.preencher_dados(nome, password, permissao)
end
And('#001011: eu clicar no botão cadastrar.') do
  @cadastrar_page.clicar_cadastrar
end

Then('#001011: eu vejo um alerta informando é necessário selecionar um item da lista') do
  permissao_field = find('#permissao')
  expect(permissao_field.value).to eq ''
end
