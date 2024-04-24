class CreateMunicipios < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE municipios(
        codigo_municipio INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo_uf INTEGER NOT NULL,
        nome TEXT,

        FOREIGN KEY codigo_uf REFERENCES(uf)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS municipios;
    SQL
  end
end
