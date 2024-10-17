include SetUp, SetDown

Dado('#1901: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1901: eu já tenha criado um Atendimento e Status previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')

  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
  SetUp.status('001a 002RIR 003fornecedor_principal', 'Pendente')
end

E('#1901: eu já tenha criado um Atendimento com valores alternativos') do
  SetUp.cliente('cliente_alternativo', 'XXXXXXXXXXXX02')
  SetUp.site('cliente_alternativo', 'RIR2', 'site_alternativo', '20')
  SetUp.fornecedor('fornecedor_alternativo')

  SetUp.atendimento('RIR2', 'fornecedor_alternativo', '20')
end

E('#1901: eu tiver passado o mouse sobre a aba Status') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#statuses')
end

E('#1901: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#1901: eu tenha clicado no link Editar do Status criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('statuses')
  @listar_todos_page.clicar_link_editar
end

Quando('#1901: eu escolher o item da Originário {string}') do |item|
  @form_status = FormPage.new('status')
  @form_status.selecionar_item('#select-originario', item)
end

E('#1901: eu escolher o item da lista Situação {string}') do |item|
  @form_status.selecionar_item('#status_codigo_situacao', item)
end

E('#1901: eu clicar no botão Enviar.') do
  @form_status.clicar_enviar
end

Então('#1901: eu sou redirecionado para detalhes do Status contendo valores atualizados e valores autopreenchidos') do
  expected_values = { '#codigo_acfs_composto-value' => '001a 002(001a 002RIR2 003fornecedor_alternativo) 003Ativo',
                      '#tabela-value' => 'Atendimento',
                      '#codigo_situacao-value' => 'Ativo',
                      '#data-value' => Date.today.to_s
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#1901: eu vejo a informação de que o Status foi atualizado com sucesso com o valor de codigo acfs composto.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Status com codigo acfs composto '001a 002(001a 002RIR2 003fornecedor_alternativo) 003Ativo' foi ATUALIZADO com sucesso."
end
