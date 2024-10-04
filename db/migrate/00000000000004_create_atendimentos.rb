class CreateAtendimentos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE atendimentos(
        codigo_atendimento INTEGER PRIMARY KEY AUTOINCREMENT,
        tabela_dto TEXT GENERATED ALWAYS AS ( '001' || 'a ' ||
                                              '002' || designacao || ' ' ||
                                              '003' || nome_fornecedor) STORED,
        codigo_atendimento_composto TEXT UNIQUE GENERATED ALWAYS AS ( '001' || designacao || ' ' ||
                                                                      '002' || nome_fornecedor) STORED,
        designacao TEXT NOT NULL,
        nome_fornecedor TEXT NOT NULL,
        codigo_tecnologia_link INTEGER,
        codigo_tipo_link INTEGER,
        velocidade_down NUMERIC NOT NULL,
        velocidade_up NUMERIC,
        ip INTEGER NOT NULL,
        ip_fixo TEXT,
        pppoe_login TEXT,
        pppoe_senha TEXT,
        link INTEGER,
        dia_vencimento INTEGER DEFAULT 25,
        valor_mensal VARCHAR(14),
        valor_instalacao VARCHAR(14),
        codigo_meio_pagamento INTEGER,
        chave_pix TEXT,
        nota_fiscal INTEGER DEFAULT 0,
        codigo_equipamento INTEGER,

        FOREIGN KEY (designacao) REFERENCES sites(designacao),
        FOREIGN KEY (nome_fornecedor) REFERENCES fornecedors(nome_fornecedor)
        FOREIGN KEY (codigo_tecnologia_link) REFERENCES tecnologia_links(codigo_tecnologia_link),
        FOREIGN KEY (codigo_tipo_link) REFERENCES tipo_links(codigo_tipo_link),
        FOREIGN KEY (codigo_meio_pagamento) REFERENCES meio_pagamentos(codigo_meio_pagamento),
        FOREIGN KEY (codigo_equipamento) REFERENCES equipamentos(codigo_equipamento),

        CHECK (velocidade_down > 0),
        CHECK (velocidade_up > 0),
        CHECK (ip IN(1, 2)),
        CHECK (link IN(1, 2)),
        CHECK (nota_fiscal IN(0, 1))
        CHECK (LENGTH(valor_mensal) <= 14)
        CHECK (LENGTH(valor_instalacao) <= 14)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS atendimentos;
    SQL
  end
end
