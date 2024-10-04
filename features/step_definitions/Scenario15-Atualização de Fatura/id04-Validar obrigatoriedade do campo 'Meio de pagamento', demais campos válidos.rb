include SetUp, SetDown

Dado('#1504: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1504: eu já tenha criado um Atendimento, Status e Fatura previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')

  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
  SetUp.status('001a 002RIR 003fornecedor_principal', 'Ativo')
  SetUp.fatura('001RIR 002fornecedor_principal', '001a 002(001a 002RIR 003fornecedor_principal) 003Pendente', 'Boleto', 'Fatura não agrupada', '2024-08-25')
end

E('#1504: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1504: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#1504: eu tenha clicado no link Editar da Fatura criada previamente.') do
  @listar_todos_page = ListarTodosPage.new('faturas')
  @listar_todos_page.clicar_link_editar
end

Quando('#1504: eu escolher o item da lista Atendimentos {string}') do |item|
  @fatura_form = FormPage.new('faturas')
  @fatura_form.selecionar_item('#fatura_codigo_atendimento_composto', item)
end

E('#1504: eu escolher o item da lista Grupos {string}') do |item|
  @fatura_form.selecionar_item('#fatura_descricao_grupo', item)
end

E('#1504: eu escolher o item da lista Meio de pagamento {string}') do |item|
  @fatura_form.selecionar_item('#fatura_codigo_meio_pagamento', item)
end

E('#1504: eu escolher o item da lista Status {string}') do |item|
  @fatura_form.selecionar_item('#fatura_codigo_status', item)
end

E('#1504: eu clicar no botão Enviar.') do
  @fatura_form.clicar_enviar
end

Então('#1504: eu vejo um balão informando que é obrigatório selecionar um item para Meio de pagamento.') do
  item = find("#fatura_codigo_meio_pagamento", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end
