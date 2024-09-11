include SetUp, SetDown, Utils

Dado('#1404: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1404: eu já tenha criado um Atendimento e Status previamente') do
  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
  SetUp.status('001RIR 002fornecedor_principal', 'Atendimento', 'Pendente')
end

E('#1404: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1404: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1404: eu escolher o item da lista Atendimentos {string}') do |item|
  @fatura_form = FormPage.new('faturas')
  @fatura_form.selecionar_item('#fatura_codigo_atendimento_composto', item)
end

E('#1404: eu escolher o item da lista Grupos {string}') do |item|
  @fatura_form.selecionar_item('#fatura_descricao_grupo', item)
end

E('#1404: eu escolher o item da lista Status {string}') do |item|
  @fatura_form.selecionar_item('#fatura_codigo_status', item)
end

E('#1404: eu clicar no botão Enviar.') do
  @fatura_form.clicar_enviar
end

Então('#1404: eu vejo um balão informando que é obrigatório selecionar um item para Meio de pagamento.') do
  item = find("#fatura_codigo_meio_pagamento", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end
