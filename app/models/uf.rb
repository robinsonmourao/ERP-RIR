class Uf < ApplicationRecord
  self.table_name = 'ufs'

  attribute :codigo_uf, :integer
  attribute :sigla, :string
  attribute :nome_estado, :string

  belongs_to :municipio

  validates :sigla, presence: true, length: { maximum: 2 }
  validates :nome_estado, presence: true
end
