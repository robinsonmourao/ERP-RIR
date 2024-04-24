class CreateTecnologiaLink < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE tecnologia_link (
        codigo_tecnologia_link INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao INTEGER NOT NULL,

        CHECK (descricao IN(1,2,3))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS tecnologia_link;
    SQL
  end
end
