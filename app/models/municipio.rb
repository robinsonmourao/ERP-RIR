class Municipio < ApplicationRecord
  belongs_to :uf, foreign_key: 'codigo_uf', class_name: 'Uf'

  attribute :codigo_municipio, :integer
  attribute :codigo_uf, :integer
  attribute :nome_municipio, :string

  validates :codigo_uf, presence: true
  validates :nome_municipio, presence: true
end
