require 'sqlite3'

Before('@skip') do
  pending if ENV['CASE_SKIPPING'] == 'true'
end

After('@logout') do
  click_button "Logout"
end

After('@apagar_usuario_ao_terminar') do
  SetDown.delete_usuario
end

After('@apagar_tabela_principal_ao_terminar') do
  SetDown.remove_last_table
end

# After('@apagar_atendimentos_ao_terminar') do
#   SetDown.delete_by_query("DELETE FROM atendimentos WHERE codigo_atendimento_composto='001RIR 002fornecedor_principal';")
#   SetDown.delete_by_query("DELETE FROM atendimentos WHERE codigo_atendimento_composto='001RIR2 002fornecedor_alternativo';")
# end

# After('@apagar_boletos_ao_terminar') do
#   SetDown.delete_by_query("DELETE FROM boletos WHERE codigo_boleto_composto='001(001RIR 002boleto_principal) 0022024-08-25 003Fatura não agrupada';")
#   SetDown.delete_by_query("DELETE FROM boletos WHERE codigo_boleto_composto='001(001RIR2 002boleto_alternativo) 0022024-08-25 003Fatura não agrupada';")
# end

# After('@apagar_contatos_ao_terminar') do
#   SetDown.delete_by_query("DELETE FROM contatos WHERE codigo_contato_composto='001contato_principal 002Dono';")
#   SetDown.delete_by_query("DELETE FROM contatos WHERE codigo_contato_composto='001contato_alternativo 002Dono';")
# end

# After('@apagar_clientes_ao_terminar') do
#   SetDown.delete_by_query("DELETE FROM clientes WHERE nome_cliente='cliente_principal';")
#   SetDown.delete_by_query("DELETE FROM clientes WHERE nome_cliente='cliente_alternativo';")
# end

# After('@apagar_faturas_ao_terminar') do
#   SetDown.delete_by_query("DELETE FROM faturas WHERE codigo_fatura_composto='001(001RIR 002fornecedor_principal) 0022024-08-25 003Fatura não agrupada';")
#   SetDown.delete_by_query("DELETE FROM faturas WHERE codigo_fatura_composto='001(001RIR2 002fornecedor_alternativo) 0022024-08-25 003Fatura não agrupada';")
# end

# After('@apagar_fornecedores_ao_terminar') do
#   SetDown.delete_by_query("DELETE FROM fornecedors WHERE nome_fornecedor='fornecedor_principal';")
#   SetDown.delete_by_query("DELETE FROM fornecedors WHERE nome_fornecedor='fornecedor_alternativo';")
# end

# After('@apagar_sites_ao_terminar') do
#   SetDown.delete_by_query("DELETE FROM sites WHERE nome_site='site_principal';")
#   SetDown.delete_by_query("DELETE FROM sites WHERE nome_site='site_alternativo';")
# end

# After('@apagar_statuses_ao_terminar') do
#   SetDown.delete_by_query("DELETE FROM statuses WHERE codigo_acfs_composto='001f 002fornecedor_principal 003Ativo';")
#   SetDown.delete_by_query("DELETE FROM statuses WHERE codigo_acfs_composto='001f 002fornecedor_alternativo 003Pendente';")
# end

After do |scenario|
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
