class CreateUfs < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE ufs(
        codigo_uf INTEGER PRIMARY KEY AUTOINCREMENT,
        sigla VARCHAR(2),
        nome TEXT
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS ufs;
    SQL
  end
end
