include RunStep, SetUp, SetDown

Dado('#0601: eu já tenha realizado meu cadastro previamente com '\
     'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  RunStep.cadastrar(nome, password, permissao)
end

E('#0601: eu já tenha criado um Cliente, Site e Fornecedor previamente') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.load

  SetUp.cliente_principal
  SetUp.site_principal
  SetUp.fornecedor_principal
end

E('#0601: eu tiver passado o mouse sobre a aba Atendimentos') do
  @dashboard_page.cursor_hover('#atendimentos')
end

E('#0601: eu tiver clicado em {string}.') do |novo|
  @dashboard_page.clicar_submenu_link(novo)
end

Quando('#0601: eu escolher o item da lista Designação {string}') do |site|
  @novo_atendimento_page = NovoObjectPage.new('atendimentos')
  @novo_atendimento_page.selecionar_item('#atendimento_designacao', site)
end

E('#0601: eu escolher o item da lista Fornecedor {string}') do |fornecedor|
  @novo_atendimento_page.selecionar_item('#atendimento_codigo_fornecedor', fornecedor)
end

E('#0601: eu preencher o campo velocidade de download {string}') do |velocidade_de_download|
  @novo_atendimento_page.preencher_campo('#atendimento_velocidade_down', velocidade_de_download)
end

E('#0601: eu clicar no botão Enviar.') do
  @novo_atendimento_page.clicar_enviar
end

Então('#0601: eu sou redirecionado para detalhes do novo Atendimento criado') do
  expect(page).to have_current_path('http://127.0.0.1:3000/atendimentos', url: true)
end

E('#0601: eu vejo a informação de que o Atendimento foi criado com sucesso com o valor de codigo_atendimento_composto.') do
  @message = find('.div-success > div:nth-child(1)')
  expect(@message.text).to eql "Atendimento com codigo_atendimento_composto '001RIR 002fornecedor_principal' foi criado com sucesso."
end
