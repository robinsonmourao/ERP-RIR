include SetUp, SetDown, Utils

Dado('#1603: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1603: eu já tenha criado um Municipio "Salvador" escolhendo Uf "BA" previamente') do
  SetUp.municipio('Salvador', 'BA')
end

E('#1603: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1603: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1603: eu preencher o campo nome fornecedor {string}') do |field|
  @fornecedor_form = FormPage.new('fornecedores')
  @fornecedor_form.preencher_campo('#fornecedor_nome_fornecedor', field)
end

E('#1603: eu escolher o item da lista Municipios {string}') do |item|
  @fornecedor_form.selecionar_item('#fornecedor_codigo_municipio', item)
end

E('#1603: eu clicar no botão Enviar.') do
  @fornecedor_form.clicar_enviar
end

Então('#1603: eu sou redirecionado para detalhes do novo Fornecedor criado contendo valores informados') do
  expected_values = { '#nome_fornecedor-value' => 'fornecedor_principal',
                      '#codigo_municipio-value' => 'Salvador'
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#1603: eu vejo a informação de que o Fornecedor foi criado com sucesso contendo o valor de nome do fornecedor.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Fornecedor com nome fornecedor 'fornecedor_principal' foi criado com sucesso."
end
