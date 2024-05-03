class CreateContatos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE contatos(
        codigo_contato INTEGER PRIMARY KEY AUTOINCREMENT,
        tabela VARCHAR(1) NOT NULL,
        codigo_tipo_contato INTEGER NOT NULL,
        codigo_meio_contato INTEGER NOT NULL,
        nome_pessoa TEXT,
        descricao TEXT NOT NULL,
        observacao TEXT,

        FOREIGN KEY (codigo_tipo_contato) REFERENCES tipo_contatos(codigo_tipo_contato),
        FOREIGN KEY (codigo_meio_contato) REFERENCES meio_contatos(codigo_meio_contato),

        CHECK (tabela IN('s', 'f', 'c'))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS contatos;
    SQL
  end
end
