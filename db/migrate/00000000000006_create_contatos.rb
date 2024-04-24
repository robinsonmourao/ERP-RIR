class CreateContatos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE contatos(
        codigo_contato INTEGER NOT NULL,
        tabela VARCHAR(1) NOT NULL,
        tipo INTEGER NOT NULL,
        meio INTEGER NOT NULL,
        nome_pessoa TEXT,
        descricao TEXT NOT NULL,
        observacao TEXT,

        CHECK (tabela IN('s', 'f', 'c')),
        CHECK (meio IN('telefone', 'email','whatsapp'))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS contatos;
    SQL
  end
end
