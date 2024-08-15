require 'sqlite3'

Before('@skip') do
  pending
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
