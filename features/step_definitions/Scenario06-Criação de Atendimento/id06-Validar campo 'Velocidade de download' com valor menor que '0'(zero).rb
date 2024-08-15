include SetUp, SetDown

Dado('#0606: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#0606: eu já tenha criado um Cliente, Site e Fornecedor previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')
end

E('#0606: eu tiver passado o mouse sobre a aba Atendimentos') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#atendimentos')
end

E('#0606: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#0606: eu escolher o item da lista Designação {string}') do |site|
  @form_atendimento_page = FormPage.new('atendimentos')
  @form_atendimento_page.selecionar_item('#atendimento_designacao', site)
end

E('#0606: eu escolher o item da lista Fornecedor {string}') do |fornecedor|
  @form_atendimento_page.selecionar_item('#atendimento_nome_fornecedor', fornecedor)
end

E('#0606: eu preencher o campo velocidade de download {string}') do |velocidade_de_download|
  @form_atendimento_page.preencher_campo('#atendimento_velocidade_down', velocidade_de_download)
end

E('#0606: eu clicar no botão Enviar.') do
  @form_atendimento_page.clicar_enviar
end

Então('#0606: eu vejo uma mensagem informando que a velocidade de download deve ser maior que "0"') do
  list = find('#atendimento_velocidade_down', match: :first)
  validation_message = list.native.attribute('validationMessage')
  expect(validation_message).to eq('Este valor deve ser maior que 0.')
end
