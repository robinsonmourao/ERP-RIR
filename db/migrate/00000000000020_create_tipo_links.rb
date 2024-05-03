class CreateTipoLinks < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE tipo_links(
        codigo_tipo_link INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao INTEGER NOT NULL,

        CHECK (descricao IN(1,2,3))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS tipo_links;
    SQL
  end
end
