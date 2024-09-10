include SetUp, SetDown

Dado('#1203: eu já tenha realizado meu cadastro previamente com '\
    'nome {string}, password {string} e permissao {string}') do |nome, password, permissao|
  SetUp.cadastrar(nome, password, permissao)
end

E('#1203: eu tiver passado o mouse sobre a aba {string}') do |aba|
  @dashboard_page = DashboardPage.new
  @dashboard_page.cursor_hover("##{aba}")
end

E('#1203: eu tiver clicado em {string}.') do |link_text|
  @dashboard_page.clicar_submenu_link(link_text)
end

Quando('#1203: eu escolher o item da lista originários {string}') do |item|
  @contato_form = FormPage.new('contatos')
  @contato_form.selecionar_item('#contato_tabela', item)
end

E('#1203: eu escolher o item da lista Meio de contato {string}') do |item|
  @contato_form.selecionar_item('#contato_codigo_meio_contato', item)
end

E('#1203: eu preencher o campo descrição {string}') do |field|
  @contato_form.preencher_campo('#contato_descricao', field)
end

E('#1203: eu clicar no botão Enviar.') do
  @contato_form.clicar_enviar
end

Então('#1203: eu vejo um balão informando que é obrigatório selecionar um item para Tipo de contato.') do
  item = find("#contato_codigo_tipo_contato", match: :first)
  validation_message = item.native.attribute('validationMessage')
  expect(validation_message).to eq('Selecione um item da lista.')
end
