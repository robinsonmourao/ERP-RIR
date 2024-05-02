class CreateUsuarios < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE usuarios(
        codigo_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
        password_digest TEXT NOT NULL,
        nome TEXT NOT NULL UNIQUE,
        permissao INTEGER NOT NULL,

        CHECK (permissao IN(1,2,3,4))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS usuarios;
    SQL
  end
end
