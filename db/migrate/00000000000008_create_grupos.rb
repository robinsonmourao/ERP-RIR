class CreateGrupos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE grupos(
        codigo_grupo INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT UNIQUE NOT NULL
      );
    SQL

    execute <<-SQL
      INSERT INTO grupos (descricao) VALUES ('Fatura não agrupada');
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS grupos;
    SQL
  end
end
