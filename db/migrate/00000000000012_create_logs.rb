class CreateLogs < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE logs(
        data CURRENT_TIMESTAMP NOT NULL,
        codigo_usuario INTEGER NOT NULL,
        comando TEXT NOT NULL,

        FOREIGN KEY (codigo_usuario) REFERENCES usuarios(codigo_usuario)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS logs;
    SQL
  end
end
