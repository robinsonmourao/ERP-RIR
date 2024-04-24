class CreateMunicipios < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE municipios(
        codigo_municipio INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo_uf INTEGER NOT NULL,
        nome_municipio TEXT NOT NULL,

        FOREIGN KEY (codigo_uf) REFERENCES ufs(codigo_uf)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS municipios;
    SQL
  end
end
