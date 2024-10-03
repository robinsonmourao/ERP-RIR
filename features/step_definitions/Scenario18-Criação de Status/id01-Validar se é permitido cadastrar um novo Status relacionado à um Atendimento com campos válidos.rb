include SetUp, SetDown

Dado('#1801: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1801: eu já tenha criado um Atendimento previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')

  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
end

E('#1801: eu tiver passado o mouse sobre a aba Status') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#statuses')
end

E('#1801: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1801: eu escolher o item da Originário {string}') do |item|
  @form_status = FormPage.new('status')
  @form_status.selecionar_item('#select-originario', item)
end

E('#1801: eu clicar no botão Enviar.') do
  @form_status.clicar_enviar
end

Então('#1801: eu sou redirecionado para detalhes do novo Status criado contendo valores informados e valores autopreenchidos') do
  expected_values = { '#codigo_acfs_composto-value' => '001a 002(001a 002RIR 003fornecedor_principal) 003Pendente',
                      '#tabela-value' => 'Atendimento',
                      '#codigo_situacao-value' => 'Pendente',
                      '#data-value' => Date.today.to_s
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#1801: eu vejo a informação de que o Status foi criado com sucesso com o valor de codigo acfs composto.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Status com codigo acfs composto '001a 002(001a 002RIR 003fornecedor_principal) 003Pendente' foi criado com sucesso."
end
