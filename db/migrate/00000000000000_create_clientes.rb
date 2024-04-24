class CreateClientes < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE clientes(
        codigo_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        endereco_cliente TEXT,

        bairro TEXT,
        cidade INTEGER,
        cep TEXT(8),

        cnpj TEXT(14) NOT NULL,
        inscricao_estadual TEXT,
        inscricao_municipal TEXT
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS clientes;
    SQL
  end
end
