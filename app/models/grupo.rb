class Grupo < ApplicationRecord
  self.table_name = 'grupos'

  attribute :codigo_grupo, :integer
  attribute :descricao, :string

  has_many :fatura

  validates :descricao, presence: true, uniqueness: true
end
