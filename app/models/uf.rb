class Uf < ApplicationRecord
  self.table_name = 'ufs'

  attribute :codigo_uf, :integer
  attribute :sigla, :string
  attribute :nome_estado, :string

  validates :sigla, presence: true, length: { maximum: 2 }, uniqueness: true
  validates :nome_estado, presence: true
end
