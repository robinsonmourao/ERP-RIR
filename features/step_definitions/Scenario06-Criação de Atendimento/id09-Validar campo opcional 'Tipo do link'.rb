include SetUp, SetDown

Dado('#0609: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#0609: eu já tenha criado um Cliente, Site e Fornecedor previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')
end

E('#0609: eu tiver passado o mouse sobre a aba Atendimentos') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#atendimentos')
end

E('#0609: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#0609: eu escolher o item da lista Designação {string}') do |site|
  @form_atendimento_page = FormPage.new('atendimentos')
  @form_atendimento_page.selecionar_item('#atendimento_designacao', site)
end

E('#0609: eu escolher o item da lista Fornecedor {string}') do |fornecedor|
  @form_atendimento_page.selecionar_item('#atendimento_nome_fornecedor', fornecedor)
end

E('#0609: eu preencher o campo velocidade de download {string}') do |velocidade_de_download|
  @form_atendimento_page.preencher_campo('#atendimento_velocidade_down', velocidade_de_download)
end

E('#0609: eu escolher o item da lista Tipo do link {string}') do |tipo_link|
  @form_atendimento_page.selecionar_item('#atendimento_codigo_tipo_link', tipo_link)
end

E('#0609: eu clicar no botão Enviar.') do
  @form_atendimento_page.clicar_enviar
end

Então('#0609: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados') do
  expected_values = { '#nome_fornecedor-value' => 'fornecedor_principal', 
                      '#designacao-value' => 'RIR', 
                      '#velocidade_down-value' => '10.0',
                      '#ip-value' => 'IP Dinâmico', 
                      '#link-value' => 'Principal',
                      '#dia_vencimento-value' => '25', 
                      '#nota_fiscal-value' => 'Inexistente',

                      '#codigo_tipo_link-value' => 'Banda Larga'
  }
  expected_values.each do |id, value|
    expect(page.find("#{id}").text).to eq(value)
  end
end

E('#0609: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Atendimento com codigo atendimento composto '001RIR 002fornecedor_principal' foi criado com sucesso."
end
