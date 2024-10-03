include SetUp, SetDown

Dado('#1803: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1803: eu já tenha criado um Fornecedor previamente') do
  SetUp.fornecedor('fornecedor_principal')
end

E('#1803: eu tiver passado o mouse sobre a aba Status') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#statuses')
end

E('#1803: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1803: eu escolher o item da Originário {string}') do |site|
  @form_status = FormPage.new('status')
  @form_status.selecionar_item('#select-originario', site)
end

E('#1803: eu clicar no botão Enviar.') do
  @form_status.clicar_enviar
end

Então('#1803: eu sou redirecionado para detalhes do novo Status criado contendo valores informados e valores autopreenchidos') do
  expected_values = { '#codigo_acfs_composto-value' => '001f 002(001f 002fornecedor_principal) 003Pendente',
                      '#tabela-value' => 'Fornecedor',
                      '#codigo_situacao-value' => 'Pendente',
                      '#data-value' => Date.today.to_s
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#1803: eu vejo a informação de que o Status foi criado com sucesso com o valor de codigo acfs composto.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Status com codigo acfs composto '001f 002(001f 002fornecedor_principal) 003Pendente' foi criado com sucesso."
end
