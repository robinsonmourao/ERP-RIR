include SetUp, SetDown, Utils

Dado('#1507: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1507: eu já tenha criado um Atendimento, Status e Fatura previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')

  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
  SetUp.status('fornecedor_principal', 'Fornecedor', 'Pendente')
  SetUp.fatura('001RIR 002fornecedor_principal', '001a 002(001RIR 002fornecedor_principal) 003Pendente', 'Boleto', 'Fatura não agrupada', Utils.next_25_day_date.to_s)
end

E('#1507: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1507: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#1507: eu tenha clicado no link Editar da Fatura criada previamente.') do
  @listar_todos_page = ListarTodosPage.new('faturas')
  @listar_todos_page.clicar_link_editar
end

Quando('#1507: eu escolher o item da lista Atendimentos {string}') do |item|
  @fatura_form = FormPage.new('faturas')
  @fatura_form.selecionar_item('#fatura_codigo_atendimento_composto', item)
end

E('#1507: eu escolher o item da lista Grupos {string}') do |item|
  @fatura_form.selecionar_item('#fatura_descricao_grupo', item)
end

E('#1507: eu escolher o item da lista Meio de pagamento {string}') do |item|
  @fatura_form.selecionar_item('#fatura_codigo_meio_pagamento', item)
end

E('#1507: eu escolher o item da lista Status {string}') do |item|
  @fatura_form.selecionar_item('#fatura_codigo_status', item)
end

E('#1507: eu preencher o campo chave {string}') do |field|
  @fatura_form.preencher_campo('#fatura_chave', field)
end

E('#1507: eu clicar no botão Enviar.') do
  @fatura_form.clicar_enviar
end

Então('#1507: eu sou redirecionado para detalhes da Fatura contendo valores atualizados') do
  expected_values = { '#codigo_atendimento_composto-value' => '001RIR 002fornecedor_principal',
                      '#codigo_meio_pagamento-value' => 'Boleto',
                      '#vencimento-value' => Utils.next_25_day_date.to_s,
                      '#descricao_grupo-value' => 'Fatura não agrupada',
                      '#instalacao-value' => 'Sim',
                      '#codigo_status-value' => '001a 002(001RIR 002fornecedor_principal) 003Pendente',

                      '#chave-value' => 'dcta478j-196l-03fm-t6gh-4298er7845m2'
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#1507: eu vejo a informação de que a Fatura foi criada com sucesso contendo o valor de código fatura composto.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Fatura com codigo fatura composto '001(001RIR 002fornecedor_principal) 002#{Utils.next_25_day_date} 003Fatura não agrupada' foi ATUALIZADO com sucesso."
end
