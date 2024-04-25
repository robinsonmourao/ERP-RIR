class CreateFornecedorCidades < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE fornecedor_cidades(
        codigo_fornecedor_cidade INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo_fornecedor INTEGER NOT NULL,
        codigo_municipio INTEGER NOT NULL,
        area INTEGER,
        observacao TEXT,

        FOREIGN KEY (codigo_fornecedor) REFERENCES fornecedores(codigo_fornecedor),
        FOREIGN KEY (codigo_municipio) REFERENCES municipios(codigo_municipio),

        CHECK (area IN(0, 1, 2, 3))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS fornecedor_cidades;
    SQL
  end
end
