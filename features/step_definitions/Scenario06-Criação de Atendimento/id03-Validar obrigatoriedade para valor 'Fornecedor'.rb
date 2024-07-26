include RunStep, SetUp, SetDown

Dado('#0603: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  RunStep.cadastrar(nome, password, permissao)
end

E('#0603: eu já tenha criado um Cliente e Site previamente') do
  SetUp.cliente_principal
  SetUp.site_principal
end

E('#0603: eu tiver passado o mouse sobre a aba Atendimentos') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#atendimentos')
end

E('#0603: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#0603: eu escolher o item da lista Site {string}') do |site|
  @novo_atendimento_page = ObjectPage.new('atendimentos')
  @novo_atendimento_page.selecionar_item('#atendimento_designacao', site)
end

E('#0603: eu preencher o campo velocidade de download {string}') do |velocidade_de_download|
  @novo_atendimento_page.preencher_campo('#atendimento_velocidade_down', velocidade_de_download)
end

E('#0603: eu clicar no botão Enviar.') do
  @novo_atendimento_page.clicar_enviar
end

Então('#0603: eu vejo um balão informando que é obrigatório selecionar um item para Fornecedor') do
  item = find("#atendimento_nome_fornecedor", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end

