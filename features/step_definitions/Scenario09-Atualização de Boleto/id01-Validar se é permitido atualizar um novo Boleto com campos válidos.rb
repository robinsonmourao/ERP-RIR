include SetUp, SetDown

Dado('#0901: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#0901: eu já tenha criado um Cliente, Site, Fornecedor, Atendimento, Status, Fatura e Boleto previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')
  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
  SetUp.status('001f 002fornecedor_principal', 'Pendente')
  SetUp.fatura('001RIR 002fornecedor_principal', '001f 002(001f 002fornecedor_principal) 003Pendente', 'Boleto', 'Fatura não agrupada', '2024-08-25')
  SetUp.boleto('001RIR 002fornecedor_principal', '001(001RIR 002fornecedor_principal) 0022024-08-25 003Fatura não agrupada', 
  'Fatura não agrupada', '001f 002(001f 002fornecedor_principal) 003Pendente', '2024-08-25')
end

E('#0901: eu já tenha criado um Cliente, Site, Fornecedor, Atendimento, Status e Fatura com valores alternativos') do
  SetUp.cliente('cliente_alternativo', 'XXXXXXXXXXXX02')
  SetUp.site('cliente_alternativo', 'RIR2', 'site_alternativo', '20')
  SetUp.fornecedor('fornecedor_alternativo')
  SetUp.atendimento('RIR2', 'fornecedor_alternativo', '20')
  SetUp.status('001f 002fornecedor_alternativo', 'Ativo')
  SetUp.fatura('001RIR2 002fornecedor_alternativo', '001f 002(001f 002fornecedor_alternativo) 003Ativo', 'Boleto', 'Fatura não agrupada', '2024-08-25')
end

E('#0901: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#0901: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#0901: eu tenha clicado no link Editar do Boleto criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('boletos')
  @listar_todos_page.clicar_link_editar
end

Quando('#0901: eu escolher o item da lista Atendimento {string}') do |item|
  @boleto_page = FormPage.new('boletos')
  @boleto_page.selecionar_item('#boleto_codigo_atendimento_composto', item)
end

E('#0901: eu escolher o item da lista Fatura {string}') do |item|
  @boleto_page.selecionar_item('#boleto_codigo_fatura', item)
end

E('#0901: eu escolher o item da lista Agrupamento {string}') do |item|
  @boleto_page.selecionar_item('#boleto_descricao_grupo', item)
end

E('#0901: eu escolher o item da lista Status {string}') do |item|
  @boleto_page.selecionar_item('#boleto_codigo_status', item)
end

E('#0901: eu escolher o item da lista data de vencimento {string}') do |item|
  @boleto_page.selecionar_item('#boleto_vencimento', item)
end

E('#0901: eu clicar no botão Enviar.') do
  @boleto_page.clicar_enviar
end

Então('#0901: eu sou redirecionado para detalhes do novo Boleto criado contendo valores informados e valores autopreenchidos') do
  expected_values = { '#codigo_boleto_composto-value' => '001(001RIR2 002fornecedor_alternativo) 0022024-08-25 003Fatura não agrupada',
                      '#descricao_grupo-value' => 'Fatura não agrupada',
                      '#vencimento-value' => '2024-08-25',
                      '#codigo_status-value' => '001f 002(001f 002fornecedor_alternativo) 003Ativo'
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#0901: eu vejo a informação de que o Boleto foi atualizado com sucesso com o valor de codigo_boleto_composto {string}.') do |mensagem|
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql mensagem
end
