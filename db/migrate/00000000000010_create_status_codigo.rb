class CreateStatusCodigo < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE status_codigo(
        codigo_status INTEGER NOT NULL,
        descricao TEXT NOT NULL DEFAULT 'pendente',

        FOREIGN KEY(codigo_status) REFERENCES status(codigo_status)

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
