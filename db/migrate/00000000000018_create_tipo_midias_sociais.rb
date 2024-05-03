class CreateTipoMidiasSociais < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE tipo_midias_sociais(
        codigo_midia_social INTEGER,
        descricao TEXT NOT NULL
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS tipo_midias_sociais;
    SQL
  end
end
