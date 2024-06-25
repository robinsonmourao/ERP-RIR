class CreateTipoLinks < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE tipo_links(
        codigo_tipo_link INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT UNIQUE NOT NULL
      );
    SQL

    execute <<-SQL
      INSERT INTO tipo_links (descricao) VALUES ('IP dedicado'), ('Banda Larga'), ('VPN');
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS tipo_links;
    SQL
  end
end
