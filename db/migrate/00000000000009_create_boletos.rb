class CreateBoletos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE boletos(
        codigo_boleto_composto TEXT UNIQUE GENERATED ALWAYS AS ('001' || codigo_atendimento || ' ' ||
                                                                '002' || vencimento || ' ' ||
                                                                '003' || codigo_grupo) STORED,
        codigo_boleto INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo_atendimento INTEGER NOT NULL,
        codigo_fatura INTEGER NOT NULL,
        codigo_grupo INTEGER NOT NULL,
        codigo_local_pagamento INTEGER,
        codigo_status INTEGER,

        vencimento DATE NOT NULL,
        chave TEXT,
        data_pagamento DATE,
        valor_pagamento VARCHAR(14),
        observacao TEXT,

        FOREIGN KEY (codigo_atendimento) REFERENCES atendimentos(codigo_atendimento),
        FOREIGN KEY (codigo_fatura) REFERENCES faturas(codigo_fatura),
        FOREIGN KEY (codigo_grupo) REFERENCES grupos(codigo_grupo),
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
