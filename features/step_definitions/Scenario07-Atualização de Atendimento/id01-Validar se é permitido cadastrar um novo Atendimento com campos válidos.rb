include RunStep, SetUp, SetDown

Dado('#0701: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  RunStep.cadastrar(nome, password, permissao)
end

E('#0701: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')
  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
end

E('#0701: eu já tenha criado um Cliente, Site, Fornecedor com valores alternativos') do
  SetUp.cliente('cliente_alternativo', 'XXXXXXXXXXXX02')
  SetUp.site('cliente_alternativo', 'RIR2', 'site_alternativo', '20')
  SetUp.fornecedor('fornecedor_alternativo')
end

E('#0701: eu tiver passado o mouse sobre a aba {string}') do |endpoint|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{endpoint.downcase}")
end

E('#0701: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#0701: eu tenha clicado no link Editar do Atendimento criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('atendimentos')
  @listar_todos_page.clicar_link_editar
end

Quando('#0701: eu escolher o item da lista Designação {string}') do |site|
  @form_atendimento_page = ObjectPage.new('atendimentos')
  @form_atendimento_page.selecionar_item('#atendimento_designacao', site)
end

E('#0701: eu escolher o item da lista Fornecedor {string}') do |fornecedor|
  @form_atendimento_page.selecionar_item('#atendimento_nome_fornecedor', fornecedor)
end

E('#0701: eu preencher o campo velocidade de download {string}') do |velocidade_de_download|
  @form_atendimento_page.preencher_campo('#atendimento_velocidade_down', velocidade_de_download)
end

E('#0701: eu clicar no botão Enviar.') do
  @form_atendimento_page.clicar_enviar
end

Então('#0701: eu sou redirecionado para detalhes do Atendimento contendo valores atualizados e autopreenchidos') do
  expected_values = { '#nome_fornecedor-value' => 'fornecedor_alternativo', 
                      '#designacao-value' => 'RIR2', 
                      '#velocidade_down-value' => '20.0',
                      '#ip-value' => 'IP Dinâmico', 
                      '#link-value' => 'Principal',
                      '#dia_vencimento-value' => '25', 
                      '#nota_fiscal-value' => 'Inexistente',
  }
  expected_values.each do |id, value|
    expect(page.find("#{id}").text).to eq(value)
  end
end

E('#0701: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Atendimento com codigo atendimento composto '001RIR 002fornecedor_principal' foi ATUALIZADO com sucesso."
end
