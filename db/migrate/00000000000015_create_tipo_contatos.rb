class CreateTipoContatos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE tipo_contatos(
        codigo_tipo_contato INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS tipo_contatos;
    SQL
  end
end
