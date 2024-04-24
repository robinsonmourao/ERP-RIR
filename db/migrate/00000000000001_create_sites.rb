class CreateSites < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE sites(
        codigo_site INTEGER PRIMARY KEY AUTOINCREMENT,
        designacao TEXT UNIQUE NOT NULL,
        codigo_cliente INTEGER NOT NULL,
        nome_site TEXT NOT NULL,
        endereco TEXT,

        bairro TEXT,
        codigo_municipio INTEGER,
        cep VARCHAR(8),
        coordenadalt NUMERIC(10, 8),
        coordenadalg NUMERIC(10, 8),

        velocidade_contratada INTEGER NOT NULL,
        codigo_tipo_link INTEGER NOT NULL,
        sla NUMERIC(3, 1),
        valor_mensal NUMERIC(11, 2),
        valor_instalacao NUMERIC(11, 2),

        FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente),
        FOREIGN KEY (codigo_municipio) REFERENCES municipios(codigo_municipio),
        FOREIGN KEY (codigo_tipo_link) REFERENCES tipo_link(codigo_tipo_link),

        CHECK (velocidade_contratada > 0)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS sites;
    SQL
  end
end
