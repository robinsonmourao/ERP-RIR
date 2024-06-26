class CreateMeioContatos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE meio_contatos(
        codigo_meio_contato INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT UNIQUE NOT NULL
      );
    SQL

    execute <<-SQL
      INSERT INTO meio_contatos (descricao) VALUES ('email'), ('telefone'), ('whatsapp');
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS meio_contatos;
    SQL
  end
end
