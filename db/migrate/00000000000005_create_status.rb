class CreateStatus < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE status(
        codigo_status INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo_sfca INTEGER NOT NULL,
        tabela VARCHAR(1) NOT NULL,
        codigo_situacao INTEGER NOT NULL,
        data DATE NOT NULL DEFAULT CURRENT_DATE,

        FOREIGN KEY (codigo_sfca) REFERENCES sites(codigo_site) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
        FOREIGN KEY (codigo_sfca) REFERENCES fornecedores(codigo_fornecedor) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
        FOREIGN KEY (codigo_sfca) REFERENCES clientes(codigo_cliente) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
        FOREIGN KEY (codigo_sfca) REFERENCES atendimentos(codigo_atendimento) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED

        FOREIGN KEY (codigo_situacao) REFERENCES situacao(codigo_situacao)

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
