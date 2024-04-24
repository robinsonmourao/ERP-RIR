class CreateSites < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE sites(
        codigo_site INTEGER PRIMARY KEY AUTOINCREMENT,
        designacao TEXT UNIQUE NOT NULL,
        codigo_cliente INTEGER NOT NULL,
        nome TEXT NOT NULL,
        endereco_site TEXT,

        bairro TEXT,
        cidade INTEGER,
        cep TEXT,
        coordenadalt NUMERIC(10, 8),
        coordenadalg NUMERIC(10, 8),

        velocidade INTEGER NOT NULL,
        tipo INTEGER,
        sla NUMERIC(3, 1),
        mensal NUMERIC(11, 2),
        instalacao NUMERIC(11, 2),

        FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente),
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
