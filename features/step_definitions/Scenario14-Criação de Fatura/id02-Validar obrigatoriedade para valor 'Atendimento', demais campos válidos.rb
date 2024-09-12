include SetUp, SetDown

Dado('#1402: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1402: eu já tenha criado um Status previamente') do
  SetUp.status('001RIR 002fornecedor_principal', 'Atendimento', 'Pendente')
end

E('#1402: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1402: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1402: eu escolher o item da lista Grupos {string}') do |item|
  @fatura_form = FormPage.new('faturas')
  @fatura_form.selecionar_item('#fatura_descricao_grupo', item)
end

E('#1402: eu escolher o item da lista Meio de pagamento {string}') do |item|
  @fatura_form.selecionar_item('#fatura_codigo_meio_pagamento', item)
end

E('#1402: eu escolher o item da lista Status {string}') do |item|
  @fatura_form.selecionar_item('#fatura_codigo_status', item)
end

E('#1402: eu clicar no botão Enviar.') do
  @fatura_form.clicar_enviar
end

Então('#1402: eu vejo um balão informando que é obrigatório selecionar um item para Atendimento.') do
  item = find("#fatura_codigo_atendimento_composto", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end
