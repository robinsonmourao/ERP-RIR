class Municipio < ApplicationRecord
  self.table_name = 'municipios'

  attribute :codigo_municipio, :integer
  attribute :codigo_uf, :integer
  attribute :nome_municipio, :string

  has_one :uf, foreign_key: 'codigo_uf', class_name: 'Ufs'

  validates :codigo_uf, presence: true
  validates :nome_municipio, presence: true
end
