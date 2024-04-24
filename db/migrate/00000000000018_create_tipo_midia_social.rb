class CreateTipoMidiaSocial < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE tipo_midia_social(
        codigo_midia_social INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS tipo_midia_social;
    SQL
  end
end
