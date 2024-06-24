class CreateTecnologiaLinks < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE tecnologia_links (
        codigo_tecnologia_link INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT UNIQUE NOT NULL
      );
    SQL

    execute <<-SQL
      INSERT INTO tecnologia_links (descricao) VALUES ('Fibra'), ('Rádio'), ('Cabo');
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS tecnologia_links;
    SQL
  end
end
