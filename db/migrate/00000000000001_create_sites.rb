class CreateSites < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE sites(
        tabela_dto TEXT GENERATED ALWAYS AS ( '001' || 's ' ||
                                              '002' || nome_site || ' ' ||
                                              '003' || designacao) STORED,
        codigo_site INTEGER PRIMARY KEY AUTOINCREMENT,
        designacao TEXT UNIQUE NOT NULL,
        codigo_cliente INTEGER NOT NULL,
        nome_site TEXT UNIQUE NOT NULL,
        endereco TEXT,

        bairro TEXT,
        codigo_municipio INTEGER,
        cep VARCHAR(8),
        coordenadalt NUMERIC(10, 8),
        coordenadalg NUMERIC(10, 8),

        velocidade_contratada NUMERIC NOT NULL,
        codigo_tipo_link INTEGER,
        sla NUMERIC(3, 1),
        valor_mensal VARCHAR(14),
        valor_instalacao VARCHAR(14),

        FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente),
        FOREIGN KEY (codigo_municipio) REFERENCES municipios(codigo_municipio),
        FOREIGN KEY (codigo_tipo_link) REFERENCES tipo_links(codigo_tipo_link),

        CHECK (velocidade_contratada > 0)
        CHECK (LENGTH(valor_mensal) <= 14)
        CHECK (LENGTH(valor_instalacao) <= 14)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS sites;
    SQL
  end
end
