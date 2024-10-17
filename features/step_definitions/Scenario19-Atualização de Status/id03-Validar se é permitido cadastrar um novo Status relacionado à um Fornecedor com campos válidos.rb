include SetUp, SetDown

Dado('#1903: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1903: eu já tenha criado um Fornecedor e Status previamente') do
  SetUp.fornecedor('fornecedor_principal')
  SetUp.status('001f 002fornecedor_principal', 'Pendente')
end

E('#1903: eu já tenha criado um Fornecedor com valores alternativos') do
  SetUp.fornecedor('fornecedor_alternativo')
end

E('#1903: eu tiver passado o mouse sobre a aba Status') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#statuses')
end

E('#1903: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#1903: eu tenha clicado no link Editar do Status criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('statuses')
  @listar_todos_page.clicar_link_editar
end

Quando('#1903: eu escolher o item da Originário {string}') do |item|
  @form_status = FormPage.new('status')
  @form_status.selecionar_item('#select-originario', item)
end

E('#1903: eu escolher o item da lista Situação {string}') do |item|
  @form_status.selecionar_item('#status_codigo_situacao', item)
end

E('#1903: eu clicar no botão Enviar.') do
  @form_status.clicar_enviar
end

Então('#1903: eu sou redirecionado para detalhes do Status contendo valores atualizados e valores autopreenchidos') do
  expected_values = { '#codigo_acfs_composto-value' => '001f 002(001f 002fornecedor_alternativo) 003Ativo',
                      '#tabela-value' => 'Fornecedor',
                      '#codigo_situacao-value' => 'Ativo',
                      '#data-value' => Date.today.to_s
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#1903: eu vejo a informação de que o Status foi atualizado com sucesso com o valor de codigo acfs composto.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Status com codigo acfs composto '001f 002(001f 002fornecedor_alternativo) 003Ativo' foi ATUALIZADO com sucesso."
end
