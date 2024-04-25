class CreateBoletos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE boletos(
        codigo_fatura INTEGER NOT NULL,

        codigo_atendimento INTEGER NOT NULL,
        vencimento INTEGER NOT NULL,
        codigo_grupo INTEGER NOT NULL,

        grupo INTEGER NOT NULL,
        valor NUMERIC(11,2),
        chave TEXT,
        data_pagamento DATE,
        codigo_local_pagamento INTEGER,
        observacao TEXT,
        status INTEGER NOT NULL,

        PRIMARY KEY (codigo_atendimento, vencimento, codigo_grupo),

        FOREIGN KEY (codigo_fatura) REFERENCES faturas(codigo_fatura)
        FOREIGN KEY (codigo_atendimento) REFERENCES atendimentos(codigo_atendimento),
        FOREIGN KEY (vencimento) REFERENCES faturas(vencimento),
        FOREIGN KEY (codigo_grupo) REFERENCES grupos(codigo_grupo),
        FOREIGN KEY (codigo_local_pagamento) REFERENCES local_pagamento(codigo_local_pagamento)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS boletos;
    SQL
  end
end
