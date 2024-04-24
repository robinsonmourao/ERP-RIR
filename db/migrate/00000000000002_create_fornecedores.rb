class CreateFornecedores < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE fornecedores(
        codigo_fornecedor INTEGER PRIMARY KEY NOT NULL,
        nome TEXT NOT NULL,
        endereco_fornecedor TEXT,

        bairro TEXT,
        cidade INTEGER,
        cep VARCHAR(8),

        cnpj VARCHAR(14),
        asn  TEXT,
        site_fornecedor TEXT
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS fornecedores;
    SQL
  end
end
