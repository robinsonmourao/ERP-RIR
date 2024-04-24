class CreateFaturas < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE faturas(
        codigo_fatura INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo_atendimento INTEGER NOT NULL,
        meio_pagamento INTEGER NOT NULL,
        chave TEXT,
        valor NUMERIC(11,2),
        vencimento DATE,
        agrupamento INTEGER NOT NULL DEFAULT 1,
        instalacao INTEGER NOT NULL DEFAULT 0,
        status INTEGER NOT NULL,

        FOREIGN KEY (codigo_atendimento) REFERENCES atendimentos(codigo_atendimento),
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
