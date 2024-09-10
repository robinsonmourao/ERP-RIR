include SetUp, SetDown

Dado('#1101: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1101: eu já tenha criado um Cliente previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
end

E('#1101: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1101: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#1101: eu tenha clicado no link Editar do Cliente criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('clientes')
  @listar_todos_page.clicar_link_editar
end

Quando('#1101: eu preencher o campo nome {string}') do |item|
  @cliente_page = FormPage.new('clientes')
  @cliente_page.preencher_campo('#cliente_nome_cliente', item)
end

E('#1101: eu preencher o campo cnpj {string}') do |item|
  @cliente_page.preencher_campo('#cliente_cnpj', item)
end

E('#1101: eu clicar no botão Enviar.') do
  @cliente_page.clicar_enviar
end

Então('#1101: eu sou redirecionado para detalhes do Cliente contendo valores atualizados') do
  expected_values = { '#nome_cliente-value' => 'cliente_alternativo',
                      '#cnpj-value' => 'XXXXXXXXXXXX02'
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#1101: eu vejo a informação de que o Cliente foi atualizado com sucesso com o valor de cnpj {string}.') do |mensagem|
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql mensagem
end
