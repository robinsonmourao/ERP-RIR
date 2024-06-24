class CreateLocalPagamentos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE local_pagamentos(
        codigo_local_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT UNIQUE NOT NULL
      );
    SQL

    execute <<-SQL
      INSERT INTO local_pagamentos (descricao)
        VALUES ('Sicoob'), ('Banco do Brasil'), ('Bradesco'), ('CEF'), ('Pessoalmente');
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS local_pagamentos;
    SQL
  end
end
