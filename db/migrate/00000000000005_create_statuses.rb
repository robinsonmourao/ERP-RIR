class CreateStatuses < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE statuses(
        codigo_acfs_composto TEXT UNIQUE,
        codigo_status INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao_acfs TEXT NOT NULL,
        tabela VARCHAR(1) NOT NULL,
        codigo_situacao INTEGER DEFAULT 5,
        data DATE DEFAULT CURRENT_DATE,

        FOREIGN KEY (codigo_situacao) REFERENCES situacoes(codigo_situacao),

        CHECK (tabela IN('a', 'c', 'f', 's'))
      );
    SQL

    execute <<-SQL
      CREATE TRIGGER trigger_codigo_acfs_composto_after_insert AFTER INSERT ON statuses
      BEGIN
        UPDATE statuses 
        SET codigo_acfs_composto =
          '001' || NEW.tabela || ' ' ||
          '002' || 
          CASE 
            WHEN NEW.tabela = 'a' THEN 
              '(' || NEW.descricao_acfs || ')'
            ELSE 
              NEW.descricao_acfs
          END
          || ' ' || '003' || (SELECT descricao FROM situacoes WHERE codigo_situacao = NEW.codigo_situacao)
        WHERE rowid = NEW.rowid;
      END;
    SQL

    execute <<-SQL
      CREATE TRIGGER trigger_codigo_acfs_composto_after_update AFTER UPDATE ON statuses
      BEGIN
        UPDATE statuses 
        SET codigo_acfs_composto = 
          '001' || NEW.tabela || ' ' ||
          '002' || 
          CASE 
            WHEN NEW.tabela = 'a' THEN 
              '(' || NEW.descricao_acfs || ')'
            ELSE 
              NEW.descricao_acfs
          END
          || ' ' || '003' || (SELECT descricao FROM situacoes WHERE codigo_situacao = NEW.codigo_situacao)
        WHERE rowid = NEW.rowid;
      END;
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS statuses;
      DROP TRIGGER IF EXISTS trigger_codigo_acfs_composto_after_insert;
      DROP TRIGGER IF EXISTS trigger_codigo_acfs_composto_after_update;
    SQL
  end
end
