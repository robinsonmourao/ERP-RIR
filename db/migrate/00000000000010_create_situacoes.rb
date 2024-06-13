class CreateSituacoes < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE situacoes(
        codigo_situacao INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao INTEGER NOT NULL DEFAULT 5,

        CHECK (descricao IN(1, 2, 3, 4, 5))
      )
    SQL

    execute <<-SQL
      INSERT INTO situacoes (descricao) VALUES (1), (2), (3), (4), (5);
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS situacoes;
    SQL
  end
end
