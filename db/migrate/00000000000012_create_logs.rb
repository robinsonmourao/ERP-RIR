class CreateLogs < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE logs(
        data CURRENT_TIMESTAMP NOT NULL,
        usuario_id INTEGER NOT NULL,
        comando TEXT NOT NULL,

        FOREIGN KEY usuario_id REFERENCES(usuarios)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS logs;
    SQL
  end
end
