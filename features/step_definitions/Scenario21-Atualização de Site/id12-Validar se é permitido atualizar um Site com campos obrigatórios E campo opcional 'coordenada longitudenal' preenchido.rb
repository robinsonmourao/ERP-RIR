include SetUp, SetDown

Dado('#2112: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#2112: eu já tenha criado um Cliente e Site previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
end

E('#2112: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#2112: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#2112: eu tenha clicado no link Editar do Site criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('sites')
  @listar_todos_page.clicar_link_editar
end

Quando('#2112: eu preencher o campo coordenada longitudenal {string}') do |field|
  @form_site = FormPage.new('sites')
  @form_site.preencher_campo('#site_coordenadalg', field)
end

E('#2112: eu clicar no botão Enviar.') do
  @form_site.clicar_enviar
end

Então('#2112: eu sou redirecionado para detalhes do Site contendo valores atualizados') do
  expected_values = { '#designacao-value' => 'RIR',
                      '#codigo_cliente-value' => 'cliente_principal',
                      '#nome_site-value' => 'site_principal',
                      '#velocidade_contratada-value' => '10.0',

                      '#coordenadalg-value' => '-11.87654321'
  }
  expected_values.each do |id, value|
    expect(page.find(id).text).to eq(value)
  end
end

E('#2112: eu vejo a informação de que o Site foi atualizado com sucesso com o valor de nome do site.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Site com nome site 'site_principal' foi ATUALIZADO com sucesso."
end
