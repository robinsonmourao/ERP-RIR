class CreateBoletos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE boletos(
        codigo_boleto_composto TEXT UNIQUE GENERATED ALWAYS AS ('001(' || codigo_atendimento_composto || ') ' ||
                                                         '002' || vencimento || ' ' ||
                                                         '003' || descricao_grupo) STORED,
        codigo_boleto INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo_atendimento_composto TEXT NOT NULL,
        codigo_fatura INTEGER NOT NULL,
        descricao_grupo TEXT NOT NULL,
        codigo_local_pagamento INTEGER,
        codigo_status INTEGER NOT NULL,

        vencimento DATE NOT NULL,
        chave TEXT,
        data_pagamento DATE,
        valor_pagamento VARCHAR(14),
        observacao TEXT,

        FOREIGN KEY (codigo_fatura) REFERENCES faturas(codigo_fatura),
        FOREIGN KEY (descricao_grupo) REFERENCES grupos(descricao),
        FOREIGN KEY (codigo_local_pagamento) REFERENCES local_pagamentos(codigo_local_pagamento)
        FOREIGN KEY (codigo_status) REFERENCES statuses(codigo_status)

        CHECK (LENGTH(valor_pagamento) <= 14)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS boletos;
    SQL
  end
end
