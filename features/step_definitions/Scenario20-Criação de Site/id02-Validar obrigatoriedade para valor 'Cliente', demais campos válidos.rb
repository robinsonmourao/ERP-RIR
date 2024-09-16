include SetUp, SetDown

Dado('#2002: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#2002: eu tiver passado o mouse sobre a aba Sites') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#sites')
end

E('#2002: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#2002: eu preencher o campo designacao {string}') do |field|
  @form_site = FormPage.new('sites')
  @form_site.preencher_campo('#site_designacao', field)
end

E('#2002: eu preencher o campo nome site {string}') do |field|
  @form_site.preencher_campo('#site_nome_site', field)
end

E('#2002: eu preencher o campo velocidade contratada {string}') do |field|
  @form_site.preencher_campo('#site_velocidade_contratada', field)
end

E('#2002: eu clicar no botão Enviar.') do
  @form_site.clicar_enviar
end

Então('#2002: eu vejo um balão informando que é obrigatório selecionar um item para Cliente') do
  item = find('#site_codigo_cliente', match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end
