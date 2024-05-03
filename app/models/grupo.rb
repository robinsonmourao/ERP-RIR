class Grupo < ApplicationRecord
  self.table_name = 'grupos'

  attribute :codigo_grupo, :integer
  attribute :descricao, :integer, default: 1

  has_many :fatura

  validates :descricao, presence: true
end
