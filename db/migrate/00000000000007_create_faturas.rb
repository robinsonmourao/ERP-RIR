class CreateFaturas < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE faturas(
        codigo_fatura INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo_atendimento INTEGER NOT NULL,
        codigo_meio_pagamento INTEGER NOT NULL,
        chave TEXT,
        valor VARCHAR(14),
        vencimento DATE NOT NULL DEFAULT (strftime('%Y-%m-25', 'now')),
        codigo_grupo INTEGER NOT NULL,
        instalacao INTEGER NOT NULL DEFAULT 0,
        codigo_status INTEGER NOT NULL,

        FOREIGN KEY (codigo_atendimento) REFERENCES atendimentos(codigo_atendimento),
        FOREIGN KEY (codigo_meio_pagamento) REFERENCES meio_pagamentos(codigo_meio_pagamento),
        FOREIGN KEY (codigo_grupo) REFERENCES grupos(codigo_grupo),
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
