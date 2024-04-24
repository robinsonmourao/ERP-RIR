class CreateMidiaSocial < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE midia_social(
        tabela VARCHAR(1) NOT NULL,
        codigo_tipo_midia_social INTEGER,
        descricao TEXT NOT NULL,

        CHECK (tabela IN('f', 'c')),
        FOREIGN KEY (codigo_tipo_midia_social) REFERENCES tipo_midia_social(codigo_tipo_midia_social)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS midia_social;
    SQL
  end
end
