class CreateSites < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE sites(
        site_id INTEGER PRIMARY KEY AUTOINCREMENT,
        designacao TEXT UNIQUE NOT NULL,
        cliente INTEGER NOT NULL,
        nome TEXT NOT NULL,
        endereco_site TEXT,

        bairro TEXT,
        cidade INTEGER,
        cep TEXT,
        coordenadalt REAL,
        coordenadalg REAL,

        velocidade INTEGER NOT NULL,
        tipo INTEGER,
        sla REAL,
        mensal NUMERIC(11, 2),
        instalacao NUMERIC(11, 2),

        FOREIGN KEY (cliente) REFERENCES clientes,
        CHECK (velocidade > 0)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS sites;
    SQL
  end
end
