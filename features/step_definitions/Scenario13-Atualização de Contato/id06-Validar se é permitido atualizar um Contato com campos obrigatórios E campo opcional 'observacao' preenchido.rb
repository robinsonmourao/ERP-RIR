include SetUp, SetDown

Dado('#1306: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1306: eu já tenha criado um Contato previamente') do
  SetUp.contato('cliente', 'Dono', 'Whatsapp', '00 00000-0000')
end

E('#1306: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1306: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#1306: eu tenha clicado no link Editar do Contato criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('contatos')
  @listar_todos_page.clicar_link_editar
end

Quando('#1306: eu escolher o item da lista originários {string}') do |item|
  @contato_form = FormPage.new('contatos')
  @contato_form.selecionar_item('#contato_tabela', item)
end

E('#1306: eu escolher o item da lista Tipo de contato {string}') do |item|
  @contato_form.selecionar_item('#contato_codigo_tipo_contato', item)
end

E('#1306: eu escolher o item da lista Meio de contato {string}') do |item|
  @contato_form.selecionar_item('#contato_codigo_meio_contato', item)
end

E('#1306: eu preencher o campo descrição {string}') do |field|
  @contato_form.preencher_campo('#contato_descricao', field)
end

E('#1306: eu preencher o campo observação {string}') do |field|
  @contato_form.preencher_campo('#contato_observacao', field)
end

E('#1306: eu clicar no botão Enviar.') do
  @contato_form.clicar_enviar
end

Então('#1306: eu sou redirecionado para detalhes do novo Contato criado contendo valores informados') do
  expected_values = { '#tabela-value' => 'Cliente',
                      '#codigo_tipo_contato-value' => 'Dono',
                      '#codigo_meio_contato-value' => 'Whatsapp',
                      '#descricao-value' => '00 00000-0000',

                      '#observacao-value' => 'Observação para testes'
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#1306: eu vejo a informação de que o Contato foi atualizado com sucesso contendo o valor de contato código composto {string}.') do |valor_unico|
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Contato com codigo contato composto '#{valor_unico}' foi ATUALIZADO com sucesso."
end
