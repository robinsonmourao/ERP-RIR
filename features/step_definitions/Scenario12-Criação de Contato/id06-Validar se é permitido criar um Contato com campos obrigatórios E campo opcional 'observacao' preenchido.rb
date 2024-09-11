include SetUp, SetDown

Dado('#1206: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1206: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1206: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1206: eu escolher o item da lista originários {string}') do |item|
  @contato_form = FormPage.new('contatos')
  @contato_form.selecionar_item('#contato_tabela', item)
end

E('#1206: eu escolher o item da lista Tipo de contato {string}') do |item|
  @contato_form.selecionar_item('#contato_codigo_tipo_contato', item)
end

E('#1206: eu escolher o item da lista Meio de contato {string}') do |item|
  @contato_form.selecionar_item('#contato_codigo_meio_contato', item)
end

E('#1206: eu preencher o campo descrição {string}') do |field|
  @contato_form.preencher_campo('#contato_descricao', field)
end

E('#1206: eu preencher o campo observação {string}') do |field|
  @contato_form.preencher_campo('#contato_observacao', field)
end

E('#1206: eu clicar no botão Enviar.') do
  @contato_form.clicar_enviar
end

Então('#1206: eu sou redirecionado para detalhes do novo Contato criado contendo valores informados') do
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

E('#1206: eu vejo a informação de que o Contato foi criado com sucesso contendo o valor de código contato composto {string}.') do |valor_unico|
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Contato com codigo contato composto '#{valor_unico}' foi criado com sucesso."
end
