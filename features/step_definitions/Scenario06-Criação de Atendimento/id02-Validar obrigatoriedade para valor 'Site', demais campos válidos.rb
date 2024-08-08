include SetUp, SetDown

Dado('#0602: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#0602: eu já tenha criado um Fornecedor previamente') do
  SetUp.fornecedor('fornecedor_principal')
end

E('#0602: eu tiver passado o mouse sobre a aba Atendimentos') do
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover('#atendimentos')
end

E('#0602: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#0602: eu escolher o item da lista Fornecedor {string}') do |fornecedor|
  @form_atendimento_page = ObjectPage.new('atendimentos')
  @form_atendimento_page.selecionar_item('#atendimento_nome_fornecedor', fornecedor)
end

E('#0602: eu preencher o campo velocidade de download {string}') do |velocidade_de_download|
  @form_atendimento_page.preencher_campo('#atendimento_velocidade_down', velocidade_de_download)
end

E('#0602: eu clicar no botão Enviar.') do
  @form_atendimento_page.clicar_enviar
end

Então('#0602: eu vejo um balão informando que é obrigatório selecionar um item para Site') do
  item = find("#atendimento_designacao", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end
