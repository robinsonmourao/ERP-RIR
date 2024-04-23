class CreateMeiosPagamento < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE meios_pagamento(
        codigo INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT DEFAULT 1,

        CHECK (descricao IN(1, 2))
      )
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS meios_pagamento;
    SQL
  end
end
