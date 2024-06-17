class CreateStatuses < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE statuses(
        codigo_status INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo_acfs INTEGER NOT NULL,
        codigo_acfs_composto TEXT UNIQUE GENERATED ALWAYS AS ( '001' || tabela || ' ' ||
                                                               '002' || codigo_acfs) STORED,
        tabela VARCHAR(1) NOT NULL,
        codigo_situacao INTEGER NOT NULL,
        data DATE DEFAULT CURRENT_DATE,

        FOREIGN KEY (codigo_situacao) REFERENCES situacoes(codigo_situacao)

        CHECK (tabela IN('a', 'c', 'f', 's'))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS statuses;
    SQL
  end
end
