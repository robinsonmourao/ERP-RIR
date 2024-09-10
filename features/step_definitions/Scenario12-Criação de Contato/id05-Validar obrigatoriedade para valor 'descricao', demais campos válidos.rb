include SetUp, SetDown

Dado('#1205: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1205: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1205: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1205: eu escolher o item da lista originários {string}') do |item|
  @contato_form = FormPage.new('contatos')
  @contato_form.selecionar_item('#contato_tabela', item)
end

E('#1205: eu escolher o item da lista Tipo de contato {string}') do |item|
  @contato_form.selecionar_item('#contato_codigo_tipo_contato', item)
end

E('#1205: eu escolher o item da lista Meio de contato {string}') do |item|
  @contato_form.selecionar_item('#contato_codigo_meio_contato', item)
end

E('#1205: eu clicar no botão Enviar.') do
  @contato_form.clicar_enviar
end

Então('#1205: eu vejo um alerta informando que o campo descricao não pode ser vazio.') do
  field = find("input#contato_descricao")
  validation_message = field.native.attribute('validationMessage')
  expect(validation_message).to eq('Preencha este campo.')
end
