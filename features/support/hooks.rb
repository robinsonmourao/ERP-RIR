require 'sqlite3'
require_relative 'global_variables'

Before('@skip') do
  pending if ENV['CASE_SKIPPING'] == 'true'
end

Before do |scenario|
  if scenario.source_tag_names.include?('@skip') && ENV['CASE_SKIPPING'] == 'true'
    GlobalVariables.skip_command = true
  elsif
    GlobalVariables.skip_command = false
  end
end

After('@logout') do
  click_button "Logout"
end

After('@apagar_usuario_ao_terminar') do
  SetDown.delete_usuario
end

After('@apagar_ultima_tabela_criada_ao_terminar') do
  SetDown.remove_last_table
end

After('@apagar_atendimentos_remanscentes_ao_terminar') do
  SetDown.apagar_entidades_ao_terminar('atendimentos', 'codigo_atendimento_composto', ['001RIR 002fornecedor_principal',
                                                                                       '001RIR2 002fornecedor_alternativo'])
end

After('@apagar_clientes_remanscentes_ao_terminar') do
  SetDown.apagar_entidades_ao_terminar('clientes', 'nome_cliente', ['cliente_principal', 'cliente_alternativo'])
end

After('@apagar_objetos_remanscentes_de_atendimento') do
  SetDown.remove_last_table
  SetDown.apagar_entidades_ao_terminar('fornecedors', 'nome_fornecedor', ['fornecedor_principal', 'fornecedor_alternativo'])
  SetDown.apagar_entidades_ao_terminar('sites', 'nome_site', ['site_principal', 'site_alternativo'])
  SetDown.apagar_entidades_ao_terminar('clientes', 'nome_cliente', ['cliente_principal', 'cliente_alternativo'])
end

After('@apagar_objetos_remanscentes_de_boleto') do
  SetDown.remove_last_table
  SetDown.apagar_entidades_ao_terminar('faturas', 'codigo_fatura_composto', ['001(001RIR 002fornecedor_principal) 0022024-08-25 003Fatura não agrupada',
                                                                             '001(001RIR2 002fornecedor_alternativo) 0022024-08-25 003Fatura não agrupada'])
  SetDown.apagar_entidades_ao_terminar('statuses', 'codigo_acfs_composto', ['001f 002(001f 002fornecedor_principal) 003Pendente',
                                                                            '001f 002(001f 002fornecedor_alternativo) 003Ativo'])
  SetDown.apagar_entidades_ao_terminar('atendimentos', 'codigo_atendimento_composto', ['001RIR 002fornecedor_principal',
                                                                                       '001RIR2 002fornecedor_alternativo'])
  SetDown.apagar_entidades_ao_terminar('fornecedors', 'nome_fornecedor', ['fornecedor_principal', 'fornecedor_alternativo'])  
  SetDown.apagar_entidades_ao_terminar('sites', 'nome_site', ['site_principal', 'site_alternativo'])
  SetDown.apagar_entidades_ao_terminar('clientes', 'nome_cliente', ['cliente_principal', 'cliente_alternativo'])
end

After('@apagar_objetos_remanscentes_de_fornecedores') do
  SetDown.remove_last_table
  SetDown.apagar_entidades_ao_terminar('sites', 'nome_site', ['site_principal', 'site_alternativo'])
  SetDown.apagar_entidades_ao_terminar('clientes', 'nome_cliente', ['cliente_principal', 'cliente_alternativo'])
end

After('@apagar_objetos_remanscentes_de_fatura') do
  SetDown.remove_last_table
  SetDown.apagar_entidades_ao_terminar('statuses', 'codigo_acfs_composto', ['001a 002(001a 002RIR 003fornecedor_principal) 003Pendente',
                                                                            '001a 002(001a 002RIR2 003fornecedor_alternativo) 003Ativo'])
  SetDown.apagar_entidades_ao_terminar('atendimentos', 'codigo_atendimento_composto', ['001RIR 002fornecedor_principal',
                                                                                       '001RIR2 002fornecedor_alternativo'])
  SetDown.apagar_entidades_ao_terminar('fornecedors', 'nome_fornecedor', ['fornecedor_principal', 'fornecedor_alternativo'])
  SetDown.apagar_entidades_ao_terminar('sites', 'nome_site', ['site_principal', 'site_alternativo'])
  SetDown.apagar_entidades_ao_terminar('clientes', 'nome_cliente', ['cliente_principal', 'cliente_alternativo'])
end

After('@apagar_objetos_remanscentes_de_status') do
  SetDown.remove_last_table
  SetDown.apagar_entidades_ao_terminar('atendimentos', 'codigo_atendimento_composto', ['001RIR 002fornecedor_principal',
                                                                                       '001RIR2 002fornecedor_alternativo'])
  SetDown.apagar_entidades_ao_terminar('fornecedors', 'nome_fornecedor', ['fornecedor_principal', 'fornecedor_alternativo'])  
  SetDown.apagar_entidades_ao_terminar('sites', 'nome_site', ['site_principal', 'site_alternativo'])
  SetDown.apagar_entidades_ao_terminar('clientes', 'nome_cliente', ['cliente_principal', 'cliente_alternativo'])
end

After do
  print '] '
end

Before do |scenario|
  feature_path = scenario.location.file
  @feature_file_name = File.basename(feature_path)
  @feature_folder_name = File.basename(File.dirname(feature_path))

  $ID = extract_id_prefix.to_s

  if ENV['TERMINAL_DROP_LINES_EACH_CASE'] == 'true'
    print "\n[#{$ID}=>"
  else
    print "[#{$ID}=>"
  end
end

def extract_id_prefix
  folder_match = @feature_folder_name.match(/(Scenario)(\d+)/)
  file_match = @feature_file_name.match(/id(\d+)(-|\.\d+)/)

  folder_prefix = folder_match[2] ? folder_match[2] : "xx"

  if file_match
    if file_match[2] == '-'
      file_prefix = file_match[1] || "xx"
    else
      file_prefix = @feature_file_name.match(/(\d+)(.)(\d+)/)
    end
  else
    file_prefix = "xx"
  end

  "#{folder_prefix}_#{file_prefix}"
end
