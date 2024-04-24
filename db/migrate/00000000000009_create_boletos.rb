class CreateBoletos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE boletos(
        codigo_fatura INTEGER NOT NULL,
        grupo INTEGER NOT NULL,
        valor NUMERIC(11,2),
        chave TEXT,
        data_pagamento DATE,
        local_pagamento INTEGER,
        observacao TEXT,
        status INTEGER NOT NULL,

        FOREIGN KEY (codigo_fatura) REFERENCES faturas(codigo_fatura)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS boletos;
    SQL
  end
end
