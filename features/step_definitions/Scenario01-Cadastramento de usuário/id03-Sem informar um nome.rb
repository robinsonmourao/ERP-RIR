Given('#0103: que eu esteja na tela de cadastro.') do
  @cadastrar_page = CadastrarPage.new
  @cadastrar_page.load
end

When('#0103: eu preencher os campos pertinentes com nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  @cadastrar_page.preencher_dados(nome, password, permissao)
end
And('#0103: eu clicar no botão cadastrar.') do
  @cadastrar_page.clicar_cadastrar
end

Then('#0103: eu vejo um alerta informando que o campo não pode ser vazio') do
  nome_field = find('input#nome')
  expect(nome_field.value).to eq ''
end
