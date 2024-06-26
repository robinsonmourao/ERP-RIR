class Fornecedor < ApplicationRecord
  self.table_name = 'fornecedors'

  attribute :codigo_fornecedor, :integer
  attribute :nome_fornecedor, :string
  attribute :endereco, :text
  attribute :bairro, :text
  attribute :codigo_municipio, :integer
  attribute :cep, :string
  attribute :cnpj, :string
  attribute :asn, :text
  attribute :codigo_site, :integer

  has_many :municipio, foreign_key: 'codigo_municipio'
  has_many :site, foreign_key: 'codigo_site'

  validates :nome_fornecedor, presence: true, uniqueness: true
end
