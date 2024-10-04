include SetUp, SetDown, Utils

Dado('#1409: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1409: eu já tenha criado um Atendimento e Status previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')

  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
  SetUp.status('001a 002RIR 003fornecedor_principal', 'Pendente')
end

E('#1409: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1409: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1409: eu escolher o item da lista Atendimentos {string}') do |item|
  @fatura_form = FormPage.new('faturas')
  @fatura_form.selecionar_item('#fatura_codigo_atendimento_composto', item)
end

E('#1409: eu escolher o item da lista Grupos {string}') do |item|
  @fatura_form.selecionar_item('#fatura_descricao_grupo', item)
end

E('#1409: eu escolher o item da lista Meio de pagamento {string}') do |item|
  @fatura_form.selecionar_item('#fatura_codigo_meio_pagamento', item)
end

E('#1409: eu escolher o item da lista Status {string}') do |item|
  @fatura_form.selecionar_item('#fatura_codigo_status', item)
end

E('#1409: eu preencher o campo data de vencimento {string}') do |formated_date|
@fatura_form.preencher_data('#fatura_vencimento_3i', '#fatura_vencimento_2i', '#fatura_vencimento_1i', 
                            formated_date, @fatura_form)
end

E('#1409: eu clicar no botão Enviar.') do
  @fatura_form.clicar_enviar
end

Então('#1409: eu sou redirecionado para detalhes da nova Fatura criada contendo valores informados') do
  expected_values = { '#codigo_atendimento_composto-value' => '001RIR 002fornecedor_principal',
                      '#codigo_meio_pagamento-value' => 'Boleto',
                      '#descricao_grupo-value' => 'Fatura não agrupada',
                      '#instalacao-value' => 'Sim',
                      '#codigo_status-value' => '001a 002(001a 002RIR 003fornecedor_principal) 003Pendente',

                      '#vencimento-value' => '2024-09-10'
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#1409: eu vejo a informação de que a Fatura foi criada com sucesso contendo o valor de código fatura composto.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Fatura com codigo fatura composto '001(001RIR 002fornecedor_principal) 0022024-09-10 003Fatura não agrupada' foi criado com sucesso."
end
