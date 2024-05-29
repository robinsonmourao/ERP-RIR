class CreateSituacao< ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE situacao(
        codigo_situacao INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL DEFAULT 'pendente',

        CHECK (descricao IN('ativo','cancelado','suspenso','bloqueado','pendente'))
      )
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS situacao;
    SQL
  end
end