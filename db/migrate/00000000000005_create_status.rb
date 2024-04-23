class CreateStatus < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TABLE status(
        status_id INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo TEXT NOT NULL,
        tabela VARCHAR(1) NOT NULL,
        situacao INTEGER NOT NULL,
        data DATE NOT NULL DEFAULT CURRENT_DATE,

        FOREIGN KEY codigo REFERENCES ??,
        CHECK (tabela IN('s', 'f', 'c', 'a'))
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS status;
    SQL
  end
end
