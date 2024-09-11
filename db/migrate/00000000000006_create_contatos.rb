class CreateContatos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE contatos(
        codigo_contato_composto TEXT UNIQUE,
        codigo_contato INTEGER PRIMARY KEY AUTOINCREMENT,
        tabela VARCHAR(1) NOT NULL,
        codigo_tipo_contato INTEGER NOT NULL,
        codigo_meio_contato INTEGER NOT NULL,
        nome_pessoa TEXT,
        descricao TEXT NOT NULL,
        descricao_tipo_contato TEXT UNIQUE,
        observacao TEXT,

        FOREIGN KEY (codigo_tipo_contato) REFERENCES tipo_contatos(codigo_tipo_contato),
        FOREIGN KEY (codigo_meio_contato) REFERENCES meio_contatos(codigo_meio_contato),

        CHECK (tabela IN('s', 'f', 'c'))
      );
    SQL

    execute <<-SQL
      CREATE TRIGGER trigger_codigo_contato_composto_after_insert AFTER INSERT ON contatos
      BEGIN
        UPDATE contatos 
        SET codigo_contato_composto = '001' || NEW.descricao || ' ' ||
                                      '002' || (SELECT descricao FROM tipo_contatos WHERE codigo_tipo_contato = NEW.codigo_tipo_contato)
        WHERE rowid = NEW.rowid;
      END;
    SQL

    execute <<-SQL
      CREATE TRIGGER trigger_codigo_contato_composto_after_update AFTER UPDATE ON contatos
      BEGIN
        UPDATE contatos 
        SET codigo_contato_composto = '001' || NEW.descricao || ' ' || 
                                      '002' || (SELECT descricao FROM tipo_contatos WHERE codigo_tipo_contato = NEW.codigo_tipo_contato)
        WHERE rowid = NEW.rowid;
      END;
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS contatos;
      DROP TRIGGER IF EXISTS trigger_codigo_contato_composto_after_insert;
      DROP TRIGGER IF EXISTS trigger_codigo_contato_composto_after_update;
    SQL
  end
end
