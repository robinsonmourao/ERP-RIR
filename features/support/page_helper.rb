require 'capybara'
require 'capybara/dsl'
require 'sqlite3'

Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }

module Pages
  def login_page_helper
    @login ||= LoginPage.new
  end
end

module SetUp
  def initialize
    $objetos_map ||= []
  end

  BASE_PATH = "/home/robinson/Desktop/ERP-RIR/"

  def execute_sql(query)
    db = SQLite3::Database.new "#{BASE_PATH}/storage/development.sqlite3"
    result = db.execute(query)
  ensure
    db.close if db
    result
  end

  def cadastrar(nome, password, permissao)
    @cadastrar_page = CadastrarPage.new
    @cadastrar_page.load

    @cadastrar_page.preencher_dados(nome, password, permissao)
    @cadastrar_page.clicar_cadastrar
  end

  def atendimento(designacao, nome_fornecedor, velocidade_down)
    return if capture_id_if_exists_by_query("codigo_atendimento", "atendimentos", "codigo_atendimento_composto", "001#{designacao} 002#{nome_fornecedor}") && ENV['FAST_MODE'] == 'true'

    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#atendimentos')
    @dashboard_page.clicar_submenu_link('Novo')

    @atendimento_principal = ObjectPage.new('atendimentos')
    @atendimento_principal.selecionar_item('#atendimento_designacao', designacao)
    @atendimento_principal.selecionar_item('#atendimento_nome_fornecedor', nome_fornecedor)
    @atendimento_principal.preencher_campo('#atendimento_velocidade_down', velocidade_down)

    @atendimento_principal.clicar_enviar

    capture_id_by_link
  end

  def cliente(nome_cliente, cnpj)
    return if capture_id_if_exists_by_query("codigo_cliente", "clientes", "cnpj", cnpj) && ENV['FAST_MODE'] == 'true'

    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#clientes')
    @dashboard_page.clicar_submenu_link('Novo')

    @cliente_principal = ObjectPage.new('clientes')
    @cliente_principal.preencher_campo('#cliente_nome_cliente', nome_cliente)
    @cliente_principal.preencher_campo('#cliente_cnpj', cnpj)

    @cliente_principal.clicar_enviar

    capture_id_by_link
  end

  def site(codigo_cliente, designacao, nome_site, velocidade_contratada)
    return if capture_id_if_exists_by_query("codigo_site", "sites", "nome_site", nome_site) && ENV['FAST_MODE'] == 'true'

    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#sites')
    @dashboard_page.clicar_submenu_link('Novo')

    @site_principal = ObjectPage.new('sites')
    @site_principal.selecionar_item('#site_codigo_cliente', codigo_cliente)
    @site_principal.preencher_campo('#site_designacao', designacao)
    @site_principal.preencher_campo('#site_nome_site', nome_site)
    @site_principal.preencher_campo('#site_velocidade_contratada', velocidade_contratada)

    @site_principal.clicar_enviar

    capture_id_by_link
  end

  def fornecedor(nome_fornecedor)
    return if capture_id_if_exists_by_query("codigo_fornecedor", "fornecedors", "nome_fornecedor", nome_fornecedor) && ENV['FAST_MODE'] == 'true'

    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#fornecedores')
    @dashboard_page.clicar_submenu_link('Novo')

    @cliente_principal = ObjectPage.new('fornecedores')
    @cliente_principal.preencher_campo('#fornecedor_nome_fornecedor', nome_fornecedor)

    @cliente_principal.clicar_enviar

    capture_id_by_link
  end

  def capture_id_if_exists_by_query(id_column_name, table_name, column_name, column_expected_value)
    id = capture_id_by_query(id_column_name, table_name, column_name, column_expected_value)
    # !id.nil?
  end

  def capture_id_by_query(id_column_name, table_name, column_name, column_expected_value)
    query = "SELECT #{id_column_name} FROM #{table_name} WHERE #{column_name} = '#{column_expected_value}';"
    id = execute_sql(query)
    if id.any?
      $objetos_map << [table_name, id[0][0]]
      id[0][0]
    end
  end

  def capture_id_by_link
    url_atual = Capybara.current_url
    partes_url = url_atual.split('/')

    $objetos_map << [@objeto, @id_criado] if id_foi_gerado?(partes_url)
  end

  def id_foi_gerado?(partes_url)
    begin
      if Integer(partes_url.last)
        @objeto = partes_url[3]
        @id_criado = partes_url.last
        true
      else
        false
      end
    rescue ArgumentError
      false
    end
  end
end

module SetDown
  $nome_usuario_atual ||= nil

  BASE_PATH = "/home/robinson/Desktop/ERP-RIR/"

  def execute_sql(query)
    db = SQLite3::Database.new "#{BASE_PATH}/storage/development.sqlite3"
    db.execute(query)
  ensure
    db.close if db
  end

  def reverse_data_base
    if ENV['FAST_MODE'] == 'false'
      if $objetos_map.any?
        $objetos_map.reverse_each do |objeto, id|
          case objeto
          when 'atendimentos'
            execute_sql("DELETE FROM atendimentos WHERE codigo_atendimento = #{id};")
          when 'clientes'
            execute_sql("DELETE FROM clientes WHERE codigo_cliente = #{id};")
          when 'sites'
            execute_sql("DELETE FROM sites WHERE codigo_site = #{id};")
          when 'fornecedors'
            execute_sql("DELETE FROM fornecedors WHERE codigo_fornecedor = #{id};")
          else
            puts "Tipo de objeto não reconhecido: #{objeto}"
          end
        end
      end
    end
    execute_sql("DELETE FROM usuarios WHERE nome = '#{$nome_usuario_atual}';")
  end
end
