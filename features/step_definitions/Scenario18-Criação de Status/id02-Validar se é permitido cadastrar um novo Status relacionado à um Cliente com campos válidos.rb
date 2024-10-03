include SetUp, SetDown

Dado('#1802: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1802: eu já tenha criado um Cliente previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
end

E('#1802: eu tiver passado o mouse sobre a aba Status') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#statuses')
end

E('#1802: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1802: eu escolher o item da Originário {string}') do |item|
  @form_status = FormPage.new('status')
  @form_status.selecionar_item('#select-originario', item)
end

E('#1802: eu clicar no botão Enviar.') do
  @form_status.clicar_enviar
end

Então('#1802: eu sou redirecionado para detalhes do novo Status criado contendo valores informados e valores autopreenchidos') do
  expected_values = { '#codigo_acfs_composto-value' => '001c 002(001c 002cliente_principal 003XXXXXXXXXXXX01) 003Pendente',
                      '#tabela-value' => 'Cliente',
                      '#codigo_situacao-value' => 'Pendente',
                      '#data-value' => Date.today.to_s
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#1802: eu vejo a informação de que o Status foi criado com sucesso com o valor de codigo acfs composto.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Status com codigo acfs composto '001c 002(001c 002cliente_principal 003XXXXXXXXXXXX01) 003Pendente' foi criado com sucesso."
end
