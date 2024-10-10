include SetUp, SetDown

Dado('#0804: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#0804: eu já tenha criado um Cliente, Site, Fornecedor, Atendimento e Status previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')
  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
  SetUp.status('001f 002fornecedor_principal', 'Pendente')
end

E('#0804: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#0804: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#0804: eu escolher o item da lista Atendimento {string}') do |item|
  @boleto_page = FormPage.new('boletos')
  @boleto_page.selecionar_item('#boleto_codigo_atendimento_composto', item)
end

E('#0804: eu escolher o item da lista Fatura {string}') do |item|
  @boleto_page.selecionar_item('#boleto_codigo_fatura', item)
end

E('#0804: eu escolher o item da lista Status {string}') do |item|
  @boleto_page.selecionar_item('#boleto_codigo_status', item)
end

E('#0804: eu escolher o item da lista data de vencimento {string}') do |item|
  @boleto_page.selecionar_item('#boleto_vencimento', item)
end

E('#0804: eu clicar no botão Enviar.') do
  @boleto_page.clicar_enviar
end

Então('#0804: eu vejo um balão informando que é obrigatório selecionar um item para Fatura.') do
  item = find("#boleto_descricao_grupo", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end
