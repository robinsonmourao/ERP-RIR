include SetUp, SetDown

Dado('#0714: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#0714: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')
  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
end

E('#0714: eu tiver passado o mouse sobre a aba {string}') do |endpoint|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{endpoint.downcase}")
end

E('#0714: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#0714: eu tenha clicado no link Editar do Atendimento criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('atendimentos')
  @listar_todos_page.clicar_link_editar
end

Quando('#0714: eu preencher o campo valor de instalação {string}') do |valor_de_instalacao|
  @form_atendimento_page = FormPage.new('atendimentos')
  @form_atendimento_page.preencher_campo('#atendimento_valor_instalacao', valor_de_instalacao)
end

E('#0714: eu clicar no botão Enviar.') do
  @form_atendimento_page.clicar_enviar
end

Então('#0714: eu sou redirecionado para detalhes do novo Atendimento criado contendo valores informados') do
  expected_values = { '#nome_fornecedor-value' => 'fornecedor_principal', 
                      '#designacao-value' => 'RIR', 
                      '#velocidade_down-value' => '10.0',
                      '#ip-value' => 'IP Dinâmico', 
                      '#link-value' => 'Principal',
                      '#dia_vencimento-value' => '25', 
                      '#nota_fiscal-value' => 'Inexistente',

                      '#valor_instalacao-value' => 'R$ 150,00' }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#0714: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto em formato <001designação 002nome_do_fornecedor>.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Atendimento com codigo atendimento composto '001RIR 002fornecedor_principal' foi ATUALIZADO com sucesso."
end
