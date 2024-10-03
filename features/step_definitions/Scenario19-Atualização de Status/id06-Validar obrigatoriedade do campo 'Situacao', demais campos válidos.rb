include SetUp, SetDown

Dado('#1906: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1906: eu já tenha criado um Cliente e Status previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')

  SetUp.status('001c 002cliente_principal', 'Pendente')
end

E('#1906: eu tiver passado o mouse sobre a aba Status') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#statuses')
end

E('#1906: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#1906: eu tenha clicado no link Editar do Status criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('statuses')
  @listar_todos_page.clicar_link_editar
end

Quando('#1906: eu escolher o item da lista Situação {string}') do |item|
  @form_status = FormPage.new('status')
  @form_status.selecionar_item('#status_codigo_situacao', item)
end

E('#1906: eu clicar no botão Enviar.') do
  @form_status.clicar_enviar
end

Então('#1906: eu vejo um balão informando que é obrigatório selecionar um item para Situação.') do
  item = find("#status_codigo_situacao", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end
