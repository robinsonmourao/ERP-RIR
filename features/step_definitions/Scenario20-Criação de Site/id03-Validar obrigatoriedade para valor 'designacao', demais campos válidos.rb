include SetUp, SetDown

Dado('#2003: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#2003: eu já tenha criado um Cliente previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
end

E('#2003: eu tiver passado o mouse sobre a aba Sites') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#sites')
end

E('#2003: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#2003: eu escolher o item da lista Cliente {string}') do |item|
  @form_site = FormPage.new('sites')
  @form_site.selecionar_item('#site_codigo_cliente', item)
end

E('#2003: eu preencher o campo nome site {string}') do |field|
  @form_site.preencher_campo('#site_nome_site', field)
end

E('#2003: eu preencher o campo velocidade contratada {string}') do |field|
  @form_site.preencher_campo('#site_velocidade_contratada', field)
end

E('#2003: eu clicar no botão Enviar.') do
  @form_site.clicar_enviar
end

Então('#2003: eu vejo um alerta informando que o campo não pode ser vazio.') do
  item = find('#site_designacao', match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Preencha este campo.')
end
