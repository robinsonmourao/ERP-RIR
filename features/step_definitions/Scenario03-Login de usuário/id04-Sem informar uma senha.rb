Given('#0304: que eu esteja na tela entrar.') do
  @entrar_page = EntrarPage.new
  @entrar_page.load
end

When('#0304: eu preencher os campos pertinentes com nome {string} e password {string}') do |nome, password|
  @entrar_page.preencher_dados(nome, password)
end
And('#0304: eu clicar no botão Entrar.') do
  @entrar_page.clicar_entrar
end

Then('#0304: eu vejo um alerta informando que o campo não pode ser vazio') do
  field = find('input#password')
  validation_message = field.native.attribute('validationMessage')
  expect(validation_message).to eq('Preencha este campo.')
end
