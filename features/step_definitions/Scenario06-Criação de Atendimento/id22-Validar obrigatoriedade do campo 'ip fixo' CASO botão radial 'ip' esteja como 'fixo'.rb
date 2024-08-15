include SetUp, SetDown

Dado('#0622: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#0622: eu já tenha criado um Cliente, Site e Fornecedor previamente') do
  SetUp.cliente('cliente_principal', 'XXXXXXXXXXXX01')
  SetUp.site('cliente_principal', 'RIR', 'site_principal', '10')
  SetUp.fornecedor('fornecedor_principal')
end

E('#0622: eu tiver passado o mouse sobre a aba Atendimentos') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#atendimentos')
end

E('#0622: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#0622: eu escolher o item da lista Designação {string}') do |site|
  @form_atendimento_page = FormPage.new('atendimentos')
  @form_atendimento_page.selecionar_item('#atendimento_designacao', site)
end

E('#0622: eu escolher o item da lista Fornecedor {string}') do |fornecedor|
  @form_atendimento_page.selecionar_item('#atendimento_nome_fornecedor', fornecedor)
end

E('#0622: eu preencher o campo velocidade de download {string}') do |velocidade_de_download|
  @form_atendimento_page.preencher_campo('#atendimento_velocidade_down', velocidade_de_download)
end

E('#0622: eu escolher o botão radial de Categoria do ip fixo') do
  @form_atendimento_page.selecionar_radiobutton('#second-option-radio-button')
end

E('#0622: eu clicar no botão Enviar.') do
  @form_atendimento_page.clicar_enviar
end

Então('#0622: eu vejo um balão informando que é obrigatório preencher o campo IP fixo.') do
  item = find("#expandable_text", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Preencha este campo.')
end
