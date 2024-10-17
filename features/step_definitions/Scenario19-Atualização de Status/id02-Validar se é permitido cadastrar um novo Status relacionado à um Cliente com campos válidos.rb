include SetUp, SetDown

Dado('#1902: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1902: eu já tenha criado um Cliente e Status previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.status('001c 002cliente_principal', 'Pendente')
end

E('#1902: eu já tenha criado um Cliente com valores alternativos') do
  SetUp.cliente('cliente_alternativo', 'XXXXXXXXXXXX02')
end

E('#1902: eu tiver passado o mouse sobre a aba Status') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#statuses')
end

E('#1902: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#1902: eu tenha clicado no link Editar do Status criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('statuses')
  @listar_todos_page.clicar_link_editar
end

Quando('#1902: eu escolher o item da Originário {string}') do |item|
  @form_status = FormPage.new('status')
  @form_status.selecionar_item('#select-originario', item)
end

E('#1902: eu escolher o item da lista Situação {string}') do |item|
  @form_status.selecionar_item('#status_codigo_situacao', item)
end

E('#1902: eu clicar no botão Enviar.') do
  @form_status.clicar_enviar
end

Então('#1902: eu sou redirecionado para detalhes do Status contendo valores atualizados e valores autopreenchidos') do
  expected_values = { '#codigo_acfs_composto-value' => '001c 002(001c 002cliente_alternativo 003XXXXXXXXXXXX02) 003Ativo',
                      '#tabela-value' => 'Cliente',
                      '#codigo_situacao-value' => 'Ativo',
                      '#data-value' => Date.today.to_s
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#1902: eu vejo a informação de que o Status foi atualizado com sucesso com o valor de codigo acfs composto.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Status com codigo acfs composto '001c 002(001c 002cliente_alternativo 003XXXXXXXXXXXX02) 003Ativo' foi ATUALIZADO com sucesso."
end
