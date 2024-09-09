include SetUp, SetDown

Dado('#1001: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1001: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1001: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1001: eu preencher o campo nome {string}') do |item|
  @cliente_page = FormPage.new('clientes')
  @cliente_page.preencher_campo('#cliente_nome_cliente', item)
end

E('#1001: eu preencher o campo cnpj {string}') do |item|
  @cliente_page.preencher_campo('#cliente_cnpj', item)
end

E('#1001: eu clicar no botão Enviar.') do
  @cliente_page.clicar_enviar
end

Então('#1001: eu sou redirecionado para detalhes do novo Cliente criado contendo valores informados') do
  expected_values = { '#nome_cliente-value' => 'cliente_principal',
                      '#cnpj-value' => 'XXXXXXXXXXXX01'
  }
  expected_values.each do |id, value|
    expect(page.find("#{id}").text).to eq(value)
  end
end

E('#1001: eu vejo a informação de que o Cliente foi criado com sucesso com o valor de cnpj {string}.') do |mensagem|
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql mensagem
end
