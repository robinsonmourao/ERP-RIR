class CreateAtendimentos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE atendimentos(
        atendimento_id INTEGER PRIMARY KEY AUTOINCREMENT,
        designação TEXT NOT NULL,
        fornecedor INTEGER NOT NULL,
        tecnologia INTEGER,
        tipo INTEGER,
        velocidade_down INTEGER NOT NULL,
        velocidade_up INTEGER,
        ip TEXT NOT NULL,
        ip_fixo TEXT,
        pppoe_login TEXT,
        pppoe_senha TEXT,
        principal TEXT,
        vencimento INTEGER NOT NULL DEFAULT 25,
        valor_Mensal NUMERIC(11,2),
        valor_instalacao NUMERIC(11,2),
        meio_pagamento INTEGER DEFAULT("boleto"),
        chave_pix TEXT,
        nota_fiscal INTEGER DEFAULT 0,
        codigo_equipamento INTEGER,
        mac_equipamento TEXT,
        serial_equipamento TEXT,

        CHECK (velocidade_down > 0),
        CHECK (velocidade_up > 0),
        CHECK (ip IN('Fixo', 'Dinamico')),
        CHECK (principal IN('link principal', 'link backup')),
        CHECK (nota_fiscal IN(0, 1)),
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS atendimentos;
    SQL
  end
end
