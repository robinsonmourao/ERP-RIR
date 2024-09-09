include SetUp, SetDown

Dado('#1003: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1003: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1003: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1003: eu preencher o campo nome {string}') do |item|
  @cliente_page = FormPage.new('clientes')
  @cliente_page.preencher_campo('#cliente_nome_cliente', item)
end

E('#1003: eu clicar no botão Enviar.') do
  @cliente_page.clicar_enviar
end

Então('#1003: eu vejo um alerta informando que o campo não pode ser vazio.') do
  field = find('input#cliente_cnpj')
  validation_message = field.native.attribute('validationMessage')
  expect(validation_message).to eq('Preencha este campo.')
end
