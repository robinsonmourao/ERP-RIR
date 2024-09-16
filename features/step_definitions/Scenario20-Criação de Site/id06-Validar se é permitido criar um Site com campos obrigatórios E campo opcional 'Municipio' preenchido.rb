include SetUp, SetDown

Dado('#2006: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#2006: eu já tenha criado um Cliente previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
end

E('#2006: eu já tenha criado um Municipio "Salvador" escolhendo Uf "BA" previamente') do
  SetUp.municipio('Salvador', 'BA')
end

E('#2006: eu tiver passado o mouse sobre a aba Sites') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#sites')
end

E('#2006: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#2006: eu escolher o item da lista Cliente {string}') do |item|
  @form_site = FormPage.new('sites')
  @form_site.selecionar_item('#site_codigo_cliente', item)
end

E('#2006: eu preencher o campo designacao {string}') do |field|
  @form_site.preencher_campo('#site_designacao', field)
end

E('#2006: eu preencher o campo nome site {string}') do |field|
  @form_site.preencher_campo('#site_nome_site', field)
end

E('#2006: eu preencher o campo velocidade contratada {string}') do |field|
  @form_site.preencher_campo('#site_velocidade_contratada', field)
end

E('#2006: eu escolher o item da lista Municipio {string}') do |item|
  @form_site.selecionar_item('#site_codigo_municipio', item)
end

E('#2006: eu clicar no botão Enviar.') do
  @form_site.clicar_enviar
end

Então('#2006: eu sou redirecionado para detalhes do novo Site criado contendo valores informados') do
  expected_values = { '#designacao-value' => 'RIR',
                      '#codigo_cliente-value' => 'cliente_principal',
                      '#nome_site-value' => 'site_principal',
                      '#velocidade_contratada-value' => '10.0',

                      '#codigo_municipio-value' => 'Salvador'
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#2006: eu vejo a informação de que o Site foi criado com sucesso com o valor de nome do site.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Site com nome site 'site_principal' foi criado com sucesso."
end
