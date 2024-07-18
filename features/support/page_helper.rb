Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }

module Pages
  def login_page_helper
    @login ||= LoginPage.new
  end
end

module RunStep

  def pegar_id_atual
    url_atual = Capybara.current_url
    id_criado = url_atual.split('/').last
  
    # Exibir o ID capturado (opcional)
    puts "ID do site criado: #{id_criado}"
  
    id_criado
  end
  
  def cadastrar(nome, password, permissao)
    @cadastrar_page = CadastrarPage.new
    @cadastrar_page.load

    @cadastrar_page.preencher_dados(nome, password, permissao)
    @cadastrar_page.clicar_cadastrar
    sleep(1)
  end
end

module SetUp
  def cliente_principal
    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#clientes')
    @dashboard_page.clicar_submenu_link('Novo')

    @cliente_principal = NovoObjectPage.new('clientes')
    @cliente_principal.preencher_campo('#cliente_nome_cliente', 'cliente_principal')
    @cliente_principal.preencher_campo('#cliente_cnpj', 'XXXXXXXXXXXX01')
    @cliente_principal.clicar_enviar

    pegar_id_atual
  end

  def site_principal
    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#sites')
    @dashboard_page.clicar_submenu_link('Novo')

    @site_principal = NovoObjectPage.new('sites')
    @site_principal.selecionar_item('#site_codigo_cliente', 'cliente_principal')
    @site_principal.preencher_campo('#site_designacao', 'RIR')
    @site_principal.preencher_campo('#site_nome_site', 'site_principal')
    @site_principal.preencher_campo('#site_velocidade_contratada', '10')
    @site_principal.clicar_enviar
  end

  def fornecedor_principal
    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#fornecedores')
    @dashboard_page.clicar_submenu_link('Novo')

    @cliente_principal = NovoObjectPage.new('fornecedores')
    @cliente_principal.preencher_campo('#fornecedor_nome_fornecedor', 'fornecedor_principal')
    @cliente_principal.clicar_enviar
  end
end

def execute_sql(query)
  ActiveRecord::Base.connection.execute(query)
end

module SetDown
  # def limpar_dados_de_teste
  #   execute_sql("DELETE FROM clientes WHERE nome_cliente = 'cliente_principal';")
  # end
end

World(SetDown)
