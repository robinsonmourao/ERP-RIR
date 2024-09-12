include SetUp, SetDown, Utils

Dado('#1702: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1702: eu já tenha criado um Fornecedor previamente') do
  SetUp.fornecedor('fornecedor_principal')
end

E('#1702: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1702: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#1702: eu tenha clicado no link Editar do Fornecedor criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('fornecedors')
  @listar_todos_page.clicar_link_editar
end

Quando('#1702: eu preencher o campo nome fornecedor {string}') do |field|
  @fornecedor_form = FormPage.new('fornecedors')
  @fornecedor_form.preencher_campo('#fornecedor_nome_fornecedor', field)
end

E('#1702: eu clicar no botão Enviar.') do
  @fornecedor_form.clicar_enviar
end

Então('#1702: eu vejo um alerta informando que o campo não pode ser vazio.') do
  field = find("#fornecedor_nome_fornecedor")
  validation_message = field.native.attribute('validationMessage')
  expect(validation_message).to eq('Preencha este campo.')
end
