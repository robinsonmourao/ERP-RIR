class CreateFornecedores < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE fornecedores(
        fornecedor INTEGER PRIMARY KEY NOT NULL,
        nome TEXT(2000) NOT NULL,
        endereco_fornecedor TEXT(2000),

        bairro TEXT(2000),
        cidade INTEGER,
        cep TEXT(8),

        cnpj TEXT(14),
        asn  TEXT(2000),
        site_fornecedor TEXT(2000),
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS fornecedores;
    SQL
  end
end
