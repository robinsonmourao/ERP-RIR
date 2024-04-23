class CreateAtendimentos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE atendimentos(
        atendimento INTEGER PRIMARY KEY AUTOINCREMENT,
        designação TEXT NOT NULL,
        fornecedor INTEGER NOT NULL,
        tecnologia INTEGER NOT NULL,
        tipo INTEGER NOT NULL,
        velocidade_down INTEGER NOT NULL,
        velocidade_up INTEGER,
        ip     NOT NULL,
        ip_fixo TEXT,
        pppoe_login TEXT,
        pppoe_senha TEXT,
        principal   ,
        vencimento INTEGER NOT NULL,
        valor_Mensal NUMERIC(11,2),
        valor_instalacao NUMERIC(11,2),
        meio_pagamento INTEGER DEFAULT("boleto"),
        chave_pix TEXT,
        nota_fiscal     ,
        codigo_equipamento INTEGER,
        mac_equipamento TEXT,
        serial_equipamento TEXT,

        CHECK (velocidade_down > 0),
        CHECK (velocidade_up > 0)
      );
    SQL
  end
end
