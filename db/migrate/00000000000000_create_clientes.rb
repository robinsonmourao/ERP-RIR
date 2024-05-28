class CreateClientes < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE clientes(
        codigo_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
        nome_cliente TEXT NOT NULL,
        endereco TEXT,

        bairro TEXT,
        codigo_municipio INTEGER,
        cep VARCHAR(8),

        cnpj VARCHAR(14) NOT NULL,
        inscricao_estadual TEXT,
        inscricao_municipal TEXT,

        FOREIGN KEY (codigo_municipio) REFERENCES municipios(codigo_municipio)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS clientes;
    SQL
  end
end
