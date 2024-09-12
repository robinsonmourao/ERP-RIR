include SetUp, SetDown

Dado('#1405: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1405: eu já tenha criado um Atendimento previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')

  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
end

E('#1405: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1405: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1405: eu escolher o item da lista Atendimentos {string}') do |item|
  @fatura_form = FormPage.new('faturas')
  @fatura_form.selecionar_item('#fatura_codigo_atendimento_composto', item)
end

E('#1405: eu escolher o item da lista Grupos {string}') do |item|
  @fatura_form.selecionar_item('#fatura_descricao_grupo', item)
end

E('#1405: eu escolher o item da lista Meio de pagamento {string}') do |item|
  @fatura_form.selecionar_item('#fatura_codigo_meio_pagamento', item)
end

E('#1405: eu clicar no botão Enviar.') do
  @fatura_form.clicar_enviar
end

Então('#1405: eu vejo um balão informando que é obrigatório selecionar um item para Status.') do
  item = find("#fatura_codigo_status", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end
