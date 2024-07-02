require 'sqlite3'

Before('@skip') do
  pending
end

After('@logout') do
  click_button "Logout"
  sleep(1)
end

After('@apagar_usuario_ao_terminar') do
  execute <<-SQL
    DELETE FROM usuarios WHERE nome='UsuarioSuper';
  SQL
end
