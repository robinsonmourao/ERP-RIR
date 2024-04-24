class CreateContatoMeio < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE contato_meio(
        codigo_contato_meio INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL,

        CHECK (descricao IN('email', 'telefone', 'whatsapp'))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS contato_meio;
    SQL
  end
end
