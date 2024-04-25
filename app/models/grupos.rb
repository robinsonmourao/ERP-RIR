class Grupo < ApplicationRecord
  self.table_name = 'grupos'

  attribute :codigo_grupo, :integer
  attribute :descricao, :integer, default: 1

  has_many :faturas, foreign_key: 'codigo_grupo'

  validates :descricao, presence: true
end
