include SetUp, SetDown

Dado('#2107: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#2107: eu já tenha criado um Cliente e Site previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
end

E('#2107: eu já tenha criado um Tipo de link {string} previamente') do |tipo_link|
  SetUp.tipo_link(tipo_link)
end


E('#2107: eu já tenha criado um Cliente com valores alternativos previamente') do
  SetUp.cliente('cliente_alternativo', 'XXXXXXXXXXXX02')
end

E('#2107: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#2107: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#2107: eu tenha clicado no link Editar do Site criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('sites')
  @listar_todos_page.clicar_link_editar
end

Quando('#2107: eu escolher o item da lista Cliente {string}') do |item|
  @form_site = FormPage.new('sites')
  @form_site.selecionar_item('#site_codigo_cliente', item)
end

E('#2107: eu preencher o campo designacao {string}') do |field|
  @form_site.preencher_campo('#site_designacao', field)
end

E('#2107: eu preencher o campo nome site {string}') do |field|
  @form_site.preencher_campo('#site_nome_site', field)
end

E('#2107: eu preencher o campo velocidade contratada {string}') do |field|
  @form_site.preencher_campo('#site_velocidade_contratada', field)
end

E('#2107: eu escolher o item da lista Tipo de link {string}') do |item|
  @form_site.selecionar_item('#site_codigo_tipo_link', item)
end

E('#2107: eu clicar no botão Enviar.') do
  @form_site.clicar_enviar
end

Então('#2107: eu sou redirecionado para detalhes do Site contendo valores atualizados') do
  expected_values = { '#designacao-value' => 'RIR2',
                      '#codigo_cliente-value' => 'cliente_alternativo',
                      '#nome_site-value' => 'site_alternativo',
                      '#velocidade_contratada-value' => '20.0',

                      '#codigo_tipo_link-value' => 'Rádio'
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#2107: eu vejo a informação de que o Site foi atualizado com sucesso com o valor de nome do site.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Site com nome site 'site_alternativo' foi ATUALIZADO com sucesso."
end
