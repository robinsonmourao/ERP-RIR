class CreateFornecedorCidades < ActiveRecord::Migrate[7.1]
  def up
    execute <<-SQL
      CREATE TABLE fornecedor_cidades(
        fornecedor INTEGER NOT NULL,
        cidade INTEGER NOT NULL,
        area INTEGER,
        observacao TEXT,

        FOREIGN KEY fornecedor REFERENCES(fornecedores)
        CHECK (area IN(0, 1, 2, 3))
      );
    SQL
  end
end
