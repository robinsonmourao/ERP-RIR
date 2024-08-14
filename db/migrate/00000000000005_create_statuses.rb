class CreateStatuses < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE statuses(
        codigo_acfs_composto TEXT UNIQUE GENERATED ALWAYS AS ( '001' || tabela || ' ' ||
                                                               '002(' || descricao_acfs || ')') STORED,
        codigo_status INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao_acfs TEXT NOT NULL,
        tabela VARCHAR(1) NOT NULL,
        codigo_situacao INTEGER DEFAULT 5,
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
