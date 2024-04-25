class Fornecedor < ApplicationRecord
  self.table_name = 'fornecedores'

  attribute :codigo_fornecedor, :integer
  attribute :nome, :string
  attribute :endereco, :text
  attribute :bairro, :text
  attribute :codigo_fornecedor_cidade, :integer
  attribute :cep, :string
  attribute :cnpj, :string
  attribute :asn, :text
  attribute :site_fornecedor, :text

  has_many :fornecedor_cidade, foreign_key: 'codigo_fornecedor_cidade'

  validates :nome, presence: true
  validates :codigo_municipio, presence: true
end
