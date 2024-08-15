include SetUp, SetDown

Dado('#0706: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#0706: eu já tenha criado um Cliente, Site, Fornecedor e Atendimento previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')
  SetUp.atendimento('RIR', 'fornecedor_principal', '10')
end

E('#0706: eu tiver passado o mouse sobre a aba {string}') do |endpoint|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{endpoint.downcase}")
end

E('#0706: eu tenha clicado no link {string}') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

E('#0706: eu tenha clicado no link Editar do Atendimento criado previamente.') do
  @listar_todos_page = ListarTodosPage.new('atendimentos')
  @listar_todos_page.clicar_link_editar
end

Quando('#0706: eu preencher o campo velocidade de download {string}') do |velocidade_de_download|
  @form_atendimento_page = FormPage.new('atendimentos')
  @form_atendimento_page.preencher_campo('#atendimento_velocidade_down', velocidade_de_download)
end

E('#0706: eu clicar no botão Enviar.') do
  @form_atendimento_page.clicar_enviar
end

Então('#0706: eu vejo uma mensagem informando que a velocidade de download deve ser maior que "0"') do
  list = find('#atendimento_velocidade_down', match: :first)
  validation_message = list.native.attribute('validationMessage')
  expect(validation_message).to eq('Este valor deve ser maior que 0.')
end
