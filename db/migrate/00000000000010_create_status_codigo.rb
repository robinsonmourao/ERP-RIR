class CreateStatusCodigo < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE status_codigo(
        codigo_status_codigo INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL DEFAULT 'pendente',

        CHECK (descricao IN('ativo','cancelado','suspenso','bloqueado','pendente'))
      )
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS status_codigo;
    SQL
  end
end
