class CreateFornecedores < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE fornecedors(
        codigo_fornecedor INTEGER PRIMARY KEY AUTOINCREMENT,
        nome_fornecedor TEXT UNIQUE NOT NULL,
        endereco TEXT,

        bairro TEXT,
        codigo_municipio INTEGER,
        cep VARCHAR(8),

        cnpj VARCHAR(14),
        asn TEXT,
        codigo_site INTEGER,

        FOREIGN KEY (codigo_municipio) REFERENCES municipios(codigo_municipio)
        FOREIGN KEY (codigo_site) REFERENCES sites(codigo_site)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS fornecedors;
    SQL
  end
end
