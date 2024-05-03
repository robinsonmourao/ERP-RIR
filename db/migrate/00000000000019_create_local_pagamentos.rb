class CreateLocalPagamentos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE local_pagamentos(
        codigo_local_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao INTEGER NOT NULL,

        CHECK (descricao IN(1,2,3,4,5))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS local_pagamentos;
    SQL
  end
end
