class CreateGrupos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE grupos(
        codigo_grupo INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao INTEGER NOT NULL DEFAULT 1
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS grupos;
    SQL
  end
end
