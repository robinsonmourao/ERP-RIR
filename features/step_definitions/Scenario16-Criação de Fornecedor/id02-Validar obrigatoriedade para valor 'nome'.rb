include SetUp, SetDown, Utils

Dado('#1602: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1602: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1602: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1602: eu clicar no botão Enviar.') do
  @fornecedor_form = FormPage.new('fornecedores')
  @fornecedor_form.clicar_enviar
end

Então('#1602: eu vejo um alerta informando que o campo não pode ser vazio.') do
  field = find("#fornecedor_nome_fornecedor")
  validation_message = field.native.attribute('validationMessage')
  expect(validation_message).to eq('Preencha este campo.')
end
