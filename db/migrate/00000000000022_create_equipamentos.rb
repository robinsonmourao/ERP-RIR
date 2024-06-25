class CreateEquipamentos < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE equipamentos(
        codigo_equipamento INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT UNIQUE NOT NULL,
        mac_equipamento TEXT,
        serial_equipamento TEXT
      );
    SQL

    execute <<-SQL
      INSERT INTO equipamentos (descricao) VALUES ('RB750R2'), ('RB750GR3'), ('RB750'), ('RB750G'), ('RB750GL');
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS equipamentos;
    SQL
  end
end
