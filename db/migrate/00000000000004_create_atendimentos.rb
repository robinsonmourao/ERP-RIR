class CreateAtendimentos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE atendimentos(
        designacao INTEGER NOT NULL,
        codigo_fornecedor INTEGER NOT NULL,
        codigo_tecnologia_link INTEGER NOT NULL,
        codigo_tipo_link INTEGER NOT NULL,
        velocidade_down INTEGER NOT NULL,
        velocidade_up INTEGER,
        ip TEXT NOT NULL,
        ip_fixo TEXT,
        pppoe_login TEXT,
        pppoe_senha TEXT,
        link TEXT,
        dia_vencimento INTEGER DEFAULT 25,
        valor_Mensal NUMERIC(11,2),
        valor_instalacao NUMERIC(11,2),
        codigo_meio_pagamento INTEGER NOT NULL,
        chave_pix TEXT,
        nota_fiscal INTEGER DEFAULT 0,
        codigo_equipamento INTEGER NOT NULL,

        PRIMARY KEY (designacao, codigo_fornecedor),

        FOREIGN KEY (designacao) REFERENCES sites(designacao),
        FOREIGN KEY (codigo_fornecedor) REFERENCES fornecedores(codigo_fornecedor)
        FOREIGN KEY (codigo_tecnologia_link) REFERENCES tecnologia_links(codigo_tecnologia_link),
        FOREIGN KEY (codigo_tipo_link) REFERENCES tipo_links(codigo_tipo_link),
        FOREIGN KEY (codigo_meio_pagamento) REFERENCES meio_pagamentos(codigo_meio_pagamento),
        FOREIGN KEY (codigo_equipamento) REFERENCES equipamentos(codigo_equipamento),

        CHECK (velocidade_down > 0),
        CHECK (velocidade_up > 0),
        CHECK (ip IN('Fixo', 'Dinamico')),
        CHECK (link IN('principal', 'backup')),
        CHECK (nota_fiscal IN(0, 1))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS atendimentos;
    SQL
  end
end
