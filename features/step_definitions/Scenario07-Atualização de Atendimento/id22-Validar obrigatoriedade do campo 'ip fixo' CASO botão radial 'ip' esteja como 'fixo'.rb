include SetUp, SetDown

Dado('#0722: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#0722: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')
  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
end

E('#0722: eu tiver passado o mouse sobre a aba {string}') do |endpoint|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{endpoint.downcase}")
end

E('#0722: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#0722: eu tenha clicado no link Editar do Atendimento criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('atendimentos')
  @listar_todos_page.clicar_link_editar
end

Quando('#0722: eu escolher o botão radial de Categoria do ip fixo') do
  @form_atendimento_page = ObjectPage.new('atendimentos')
  @form_atendimento_page.selecionar_radiobutton('#second-option-radio-button')
end

E('#0722: eu clicar no botão Enviar.') do
  @form_atendimento_page.clicar_enviar
end

Então('#0722: eu vejo um balão informando que é obrigatório preencher o campo IP fixo.') do
  item = find("#expandable_text", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Preencha este campo.')
end
