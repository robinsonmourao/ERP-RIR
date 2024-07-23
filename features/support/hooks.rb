require 'sqlite3'

Before('@skip') do
  pending
end

After('@logout') do
  click_button "Logout"
  sleep(1)
end

After('@apagar_ao_terminar') do
  SetDown.reverse_data_base
end
