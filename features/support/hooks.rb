require 'sqlite3'

Before('@skip') do
  pending if ENV['CASE_SKIPPING'] == 'true'
end

After('@apagar_clientes_ao_terminar') do
  SetDown.remove_by_query("DELETE FROM clientes WHERE nome_cliente='cliente_principal';")
  SetDown.remove_by_query("DELETE FROM clientes WHERE nome_cliente='cliente_alternativo';")
  puts 'true'
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
