class CreateFaturas < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE faturas(
        fatura_id INTEGER PRIMARY KEY AUTOINCREMENT,
        atendimento_id INTEGER NOT NULL,
        meio_pagamento INTEGER NOT NULL,
        chave TEXT,
        valor NUMERIC(11,2),
        vencimento DATE,
        agrupamento INTEGER NOT NULL DEFAULT 1,
        instalacao INTEGER NOT NULL DEFAULT 0,
        status INTEGER NOT NULL,

        FOREIGN KEY atendimento_id REFERENCES(atendimentos)
        CHECK (instalacao IN(0,1))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS faturas;
    SQL
  end
end
