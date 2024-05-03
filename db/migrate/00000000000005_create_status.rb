class CreateStatus < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE status(
        codigo_status INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo_sfca TEXT NOT NULL,
        tabela VARCHAR(1) NOT NULL,
        situacao INTEGER NOT NULL,
        data DATE NOT NULL DEFAULT CURRENT_DATE,

        FOREIGN KEY (codigo_sfca) REFERENCES sites(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
        FOREIGN KEY (codigo_sfca) REFERENCES fornecedores(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
        FOREIGN KEY (codigo_sfca) REFERENCES clientes(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
        FOREIGN KEY (codigo_sfca) REFERENCES atendimentos(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,

        FOREIGN KEY (situacao) REFERENCES status_codigo(codigo_status_codigo)

        CHECK (tabela IN('s', 'f', 'c', 'a'))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS status;
    SQL
  end
end
