class CreateTipoContatos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE tipo_contatos(
        codigo_contato_tipo INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS tipos_contatos;
    SQL
  end
end
