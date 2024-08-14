class CreateFaturas < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE faturas(
        codigo_fatura_composto TEXT UNIQUE GENERATED ALWAYS AS ('001(' || codigo_atendimento_composto || ') ' ||
                                                         '002' || vencimento || ' ' ||
                                                         '003' || descricao_grupo) STORED,
        codigo_fatura INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo_atendimento_composto TEXT NOT NULL,
        codigo_meio_pagamento INTEGER NOT NULL,
        chave TEXT,
        valor VARCHAR(14),
        vencimento DATE NOT NULL DEFAULT (strftime('%Y-%m-25', 'now')),
        descricao_grupo TEXT NOT NULL,
        instalacao INTEGER NOT NULL DEFAULT 0,
        codigo_status INTEGER NOT NULL,

        FOREIGN KEY (codigo_meio_pagamento) REFERENCES meio_pagamentos(codigo_meio_pagamento),
        FOREIGN KEY (descricao_grupo) REFERENCES grupos(descricao),
        FOREIGN KEY (codigo_status) REFERENCES statuses(codigo_status)

        CHECK (instalacao IN(0,1))
        CHECK (LENGTH(valor) <= 14)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS faturas;
    SQL
  end
end
