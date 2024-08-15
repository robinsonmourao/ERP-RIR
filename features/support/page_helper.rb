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

    wipe("#{__method__}") if ENV['FAST_MODE'] == 'false'

    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#atendimentos')
    @dashboard_page.clicar_submenu_link('Novo')

    @atendimento_page = FormPage.new('atendimentos')
    @atendimento_page.selecionar_item('#atendimento_designacao', designacao)
    @atendimento_page.selecionar_item('#atendimento_nome_fornecedor', nome_fornecedor)
    @atendimento_page.preencher_campo('#atendimento_velocidade_down', velocidade_down)

    @atendimento_page.clicar_enviar

    capture_id_by_link
  end

  def boleto(codigo_atendimento_composto, codigo_fatura_composto, agrupamento, codigo_status_composto, data_vencimento)
    return if capture_id_if_exists_by_query("codigo_boleto", "boletos", "codigo_boleto_composto", 
                                            "001#{codigo_atendimento_composto} 002#{data_vencimento} 003#{agrupamento}") && ENV['FAST_MODE'] == 'true'

    wipe("#{__method__}") if ENV['FAST_MODE'] == 'false'

    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#boletos')
    @dashboard_page.clicar_submenu_link('Novo')

    @boleto_page = FormPage.new('boletos')
    @boleto_page.selecionar_item('#boleto_codigo_atendimento', codigo_atendimento_composto)
    @boleto_page.selecionar_item('#boleto_codigo_fatura', codigo_fatura_composto)
    @boleto_page.selecionar_item('#boleto_descricao_grupo', agrupamento)
    @boleto_page.selecionar_item('#boleto_descricao_status', codigo_status_composto)
    @boleto_page.selecionar_item('#boleto_vencimento', data_vencimento)

    @boleto_page.clicar_enviar

    capture_id_by_link
  end

  def cliente(nome_cliente, cnpj)
    return if capture_id_if_exists_by_query("codigo_cliente", "clientes", "cnpj", cnpj) && ENV['FAST_MODE'] == 'true'

    wipe("#{__method__}") if ENV['FAST_MODE'] == 'false'

    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#clientes')
    @dashboard_page.clicar_submenu_link('Novo')

    @cliente_page = FormPage.new('clientes')
    @cliente_page.preencher_campo('#cliente_nome_cliente', nome_cliente)
    @cliente_page.preencher_campo('#cliente_cnpj', cnpj)

    @cliente_page.clicar_enviar

    capture_id_by_link
  end

  def site(codigo_cliente, designacao, nome_site, velocidade_contratada)
    return if capture_id_if_exists_by_query("codigo_site", "sites", "nome_site", nome_site) && ENV['FAST_MODE'] == 'true'

    wipe("#{__method__}") if ENV['FAST_MODE'] == 'false'

    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#sites')
    @dashboard_page.clicar_submenu_link('Novo')

    @site_page = FormPage.new('sites')
    @site_page.selecionar_item('#site_codigo_cliente', codigo_cliente)
    @site_page.preencher_campo('#site_designacao', designacao)
    @site_page.preencher_campo('#site_nome_site', nome_site)
    @site_page.preencher_campo('#site_velocidade_contratada', velocidade_contratada)

    @site_page.clicar_enviar

    capture_id_by_link
  end

  def fatura(codigo_atendimento_composto, descricao_status_composto, nome_meio_pagamento, nome_grupo, vencimento)
    return if capture_id_if_exists_by_query("codigo_fatura", "faturas", "codigo_fatura_composto",
                                            "001(#{codigo_atendimento_composto}) 002#{vencimento} 003#{nome_grupo}") && ENV['FAST_MODE'] == 'true'

    wipe("#{__method__}") if ENV['FAST_MODE'] == 'false'

    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#faturas')
    @dashboard_page.clicar_submenu_link('Novo')

    @fatura_page = FormPage.new('faturas')
    @fatura_page.selecionar_item('#fatura_codigo_atendimento_composto', codigo_atendimento_composto)
    @fatura_page.selecionar_item('#fatura_codigo_status', descricao_status_composto)
    @fatura_page.selecionar_item('#fatura_codigo_meio_pagamento', nome_meio_pagamento)
    @fatura_page.selecionar_item('#fatura_descricao_grupo', nome_grupo)
    @fatura_page.preencher_data('#fatura_vencimento_3i', '#fatura_vencimento_2i', '#fatura_vencimento_1i',
                                vencimento, @fatura_page)
    @fatura_page.clicar_enviar

    capture_id_by_link
  end

  def fornecedor(nome_fornecedor)
    return if capture_id_if_exists_by_query("codigo_fornecedor", "fornecedors", "nome_fornecedor", nome_fornecedor) && ENV['FAST_MODE'] == 'true'

    wipe("#{__method__}") if ENV['FAST_MODE'] == 'false'

    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#fornecedores')
    @dashboard_page.clicar_submenu_link('Novo')

    @fornecedor_page = FormPage.new('fornecedores')
    @fornecedor_page.preencher_campo('#fornecedor_nome_fornecedor', nome_fornecedor)

    @fornecedor_page.clicar_enviar

    capture_id_by_link
  end

  def status(descricao_acfs, tipo_acfs, situacao)
    require_relative '../../config/initializers/constants'

    return if capture_id_if_exists_by_query("codigo_status", "statuses", "codigo_acfs_composto", 
                                            "001#{Categoria::CATEGORIA_REVERSE[tipo_acfs]} 002#{descricao_acfs} 003#{situacao}") && 
                                            ENV['FAST_MODE'] == 'true'

    wipe("#{__method__}") if ENV['FAST_MODE'] == 'false'

    @dashboard_page = DashboardPage.new
    @dashboard_page.load

    @dashboard_page.cursor_hover('#statuses')
    @dashboard_page.clicar_submenu_link('Novo')

    @status_page = FormPage.new('statuses')
    @status_page.selecionar_item('#status_descricao_acfs', descricao_acfs)
    @status_page.selecionar_item('#status_tabela', tipo_acfs)
    @status_page.selecionar_item('#status_codigo_situacao', situacao)

    @status_page.clicar_enviar

    capture_id_by_link
  end

  def capture_id_if_exists_by_query(id_column_name, table_name, column_name, column_expected_value)
    capture_id_by_query(id_column_name, table_name, column_name, column_expected_value)
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

  def wipe(entity)
    include SetDown
    if $objetos_map.any? && ($objetos_map.last[0] == SetDown.format_entity_to_table(entity))
      SetDown.execute_sql("DELETE FROM #{$objetos_map.last[0]} WHERE codigo_#{entity} = #{$objetos_map.last[1]};")
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

  def delete_usuario
    execute_sql("DELETE FROM usuarios WHERE nome = '#{$nome_usuario_atual}';")
  end

  def remove_last_table
    if $objetos_map.any?
      entity = format_table_to_entity($objetos_map.last[0])
      execute_sql("DELETE FROM #{$objetos_map.last[0]} WHERE codigo_#{entity} = #{$objetos_map.last[1]};")
    end
  end

  def format_table_to_entity(table)
    case table
    when 'atendimentos'
      'atendimento'
    when 'boletos'
      "boleto"
    when "contatos"
      "contato"
    when "clientes"
      "cliente"
    when "faturas"
      "fatura"
    when "fornecedors"
      "fornecedor"
    when "sites"
      "site"
    when "statuses"
      "status"
    else
      "Não foi possível converter tabela para entidade: Tabela não encontrada!"
    end
  end

  def format_entity_to_table(entity)
    case entity
    when 'atendimento'
      'atendimentos'
    when 'boleto'
      "boletos"
    when "contato"
      "contatos"
    when "cliente"
      "clientes"
    when "fatura"
      "faturas"
    when "fornecedor"
      "fornecedors"
    when "site"
      "sites"
    when "status"
      "statuses"
    else
      "Não foi possível converter entidade para tabela: Entidade não encontrada!"
    end
  end
end
