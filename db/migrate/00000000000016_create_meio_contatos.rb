class CreateMeioContatos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE meio_contatos(
        codigo_contato_meio INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL,

        CHECK (descricao IN('email', 'telefone', 'whatsapp'))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS meio_contatos;
    SQL
  end
end
