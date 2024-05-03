class Cliente < ApplicationRecord
  self.table_name = 'clientes'

  attribute :codigo_cliente, :integer
  attribute :nome_cliente, :string
  attribute :endereco, :string
  attribute :bairro, :string
  attribute :cidade, :integer
  attribute :cep, :string
  attribute :cnpj, :string
  attribute :inscricao_estadual, :string
  attribute :inscricao_municipal, :string

  has_many :contatos, dependent: destroy
  has_many :sites, dependent: destroy

  validates :nome_cliente, presence: true
  validates :cnpj, presence: true, uniqueness: true, length: { is: 14 }
end
