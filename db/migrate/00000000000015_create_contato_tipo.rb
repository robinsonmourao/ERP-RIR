class CreateContatoTipo < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE contato_tipo(
        codigo_contato_tipo INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS contato_tipo;
    SQL
  end
end
