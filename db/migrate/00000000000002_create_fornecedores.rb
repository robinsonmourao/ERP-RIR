class CreateFornecedores < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE fornecedores(
        codigo_fornecedor INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        endereco TEXT,

        bairro TEXT,
        codigo_fornecedor_cidade INTEGER,
        cep VARCHAR(8),

        cnpj VARCHAR(14),
        asn TEXT,
        site_fornecedor TEXT,

        FOREIGN KEY (codigo_fornecedor_cidade) REFERENCES fornecedor_cidade(codigo_fornecedor_cidade)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS fornecedores;
    SQL
  end
end
