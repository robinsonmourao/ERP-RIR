class CreateMeioPagamentos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE meio_pagamentos(
        codigo_meio_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao INTEGER UNIQUE NOT NULL
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS meio_pagamentos;
    SQL
  end
end
