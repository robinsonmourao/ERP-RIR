class CreateContatos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE contatos(
        tabela VARCHAR(1) NOT NULL,
        codigo_contato_tipo INTEGER NOT NULL,
        codigo_contato_meio INTEGER NOT NULL,
        nome_pessoa TEXT,
        descricao TEXT NOT NULL,
        observacao TEXT,

        PRIMARY KEY(tabela, codigo_contato_tipo),

        FOREIGN KEY (codigo_contato_tipo) REFERENCES contato_tipo(codigo_contato_tipo),
        FOREIGN KEY (codigo_contato_meio) REFERENCES contato_meio(codigo_contato_meio),

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
