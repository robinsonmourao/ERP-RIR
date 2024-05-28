class Cliente < ApplicationRecord
  self.table_name = 'clientes'

  attribute :codigo_cliente, :integer
  attribute :nome_cliente, :string
  attribute :endereco, :string
  attribute :bairro, :string
  attribute :codigo_municipio, :integer
  attribute :cep, :string
  attribute :cnpj, :string
  attribute :inscricao_estadual, :string
  attribute :inscricao_municipal, :string

  # has_many :contato
  # has_many :site
  has_one :municipio, foreign_key: 'codigo_municipio'

  validates :nome_cliente, presence: true
  validates :cnpj, presence: true, uniqueness: true, length: { is: 14 }
end
