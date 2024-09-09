include SetUp, SetDown

Dado('#1102: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1102: eu já tenha criado um Cliente previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
end

E('#1102: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1102: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#1102: eu tenha clicado no link Editar do Cliente criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('clientes')
  @listar_todos_page.clicar_link_editar
end

Quando('#1102: eu preencher o campo nome {string}') do |item|
  @cliente_page = FormPage.new('clientes')
  @cliente_page.preencher_campo('#cliente_nome_cliente', item)
end

E('#1102: eu preencher o campo cnpj {string}') do |item|
  @cliente_page.preencher_campo('#cliente_cnpj', item)
end

E('#1102: eu clicar no botão Enviar.') do
  @cliente_page.clicar_enviar
end

Então('#1102: eu vejo um alerta informando que o campo não pode ser vazio.') do
  field = find('input#cliente_nome_cliente')
  validation_message = field.native.attribute('validationMessage')
  expect(validation_message).to eq('Preencha este campo.')
end
