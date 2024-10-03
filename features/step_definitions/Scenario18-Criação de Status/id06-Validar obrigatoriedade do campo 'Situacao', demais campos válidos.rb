include SetUp, SetDown

Dado('#1806: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1806: eu já tenha criado um Site previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')

  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
end

E('#1806: eu tiver passado o mouse sobre a aba Status') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#statuses')
end

E('#1806: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1806: eu escolher o item da lista Situação {string}') do |item|
  @form_status = FormPage.new('status')
  @form_status.selecionar_item('#status_codigo_situacao', item)
end

E('#1806: eu clicar no botão Enviar.') do
  @form_status.clicar_enviar
end

Então('#1806: eu vejo um balão informando que é obrigatório selecionar um item para Situação.') do
  item = find("#status_codigo_situacao", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end
