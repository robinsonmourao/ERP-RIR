Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }

module Pages
  def login_page_helper
    @login ||= LoginPage.new
  end
end

module RunStep
  def cadastrar(nome, password, permissao)
    @cadastrar_page = CadastrarPage.new
    @cadastrar_page.load

    @cadastrar_page.preencher_dados(nome, password, permissao)
    @cadastrar_page.clicar_cadastrar
    sleep(1)
  end
end
