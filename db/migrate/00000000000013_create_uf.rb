class CreateUf < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE uf(
        codigo INTEGER PRIMARY KEY AUTOINCREMENT,
        sigla VARCHAR(2),
        nome TEXT
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS uf;
    SQL
  end
end
