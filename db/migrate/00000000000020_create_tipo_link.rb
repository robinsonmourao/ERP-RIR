class CreateTipolink < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE tipo_link(
        codigo_tipo_link INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao VARCHAR(1) NOT NULL,

        CHECK (descricao IN(1,2,3))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS tipo_link;
    SQL
  end
end
