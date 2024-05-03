class Site < ApplicationRecord
  self.table_name = 'sites'

  attribute :codigo_site, :integer
  attribute :designacao, :string
  attribute :codigo_cliente, :integer
  attribute :nome_site, :string
  attribute :endereco, :text
  attribute :bairro, :text
  attribute :codigo_municipio, :integer
  attribute :cep, :string
  attribute :coordenadalt, :decimal, precision: 10, scale: 8
  attribute :coordenadalg, :decimal, precision: 10, scale: 8
  attribute :velocidade_contratada, :integer
  attribute :codigo_tipo_link, :integer
  attribute :sla, :decimal, precision: 3, scale: 1
  attribute :valor_mensal, :decimal, precision: 11, scale: 2
  attribute :valor_instalacao, :decimal, precision: 11, scale: 2

  has_one :cliente, foreign_key: 'codigo_cliente'
  has_many :municipio, foreign_key: 'codigo_municipio'
  has_many :tipo_link, foreign_key: 'codigo_tipo_link'

  validates :designacao, presence: true, uniqueness: true
  validates :codigo_cliente, presence: true
  validates :nome_site, presence: true
  validates :velocidade_contratada, presence: true, numericality: { greater_than: 0 }
end
