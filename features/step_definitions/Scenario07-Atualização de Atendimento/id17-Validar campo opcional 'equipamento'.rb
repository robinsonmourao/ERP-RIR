include SetUp, SetDown

Dado('#0717: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#0717: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')
  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
end

E('#0717: eu tiver passado o mouse sobre a aba {string}') do |endpoint|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{endpoint.downcase}")
end

E('#0717: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#0717: eu tenha clicado no link Editar do Atendimento criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('atendimentos')
  @listar_todos_page.clicar_link_editar
end

Quando('#0717: eu escolher o item da lista Equipamento {string}') do |equipamento|
  @form_atendimento_page = ObjectPage.new('atendimentos')
  @form_atendimento_page.selecionar_item('#atendimento_codigo_equipamento', equipamento)
end

E('#0717: eu clicar no botão Enviar.') do
  @form_atendimento_page.clicar_enviar
end

Então('#0717: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados') do
  expected_values = { '#nome_fornecedor-value' => 'fornecedor_principal', 
                      '#designacao-value' => 'RIR', 
                      '#velocidade_down-value' => '10.0',
                      '#ip-value' => 'IP Dinâmico', 
                      '#link-value' => 'Principal',
                      '#dia_vencimento-value' => '25', 
                      '#nota_fiscal-value' => 'Inexistente',

                      '#codigo_equipamento-value' => 'RB750R2'
  }
  expected_values.each do |id, value|
    expect(page.find("#{id}").text).to eq(value)
  end
end

E('#0717: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Atendimento com codigo atendimento composto '001RIR 002fornecedor_principal' foi ATUALIZADO com sucesso."
end
