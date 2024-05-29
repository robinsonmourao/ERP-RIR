class Status < ApplicationRecord
  self.table_name = 'status'

  attribute :codigo_status, :integer
  attribute :codigo_sfca, :integer
  attribute :tabela, :string
  attribute :codigo_situacao, :integer
  attribute :data, :date

  has_many :site, foreign_key: 'codigo_sfca'
  has_many :fornecedor, foreign_key: 'codigo_sfca'
  has_many :cliente, foreign_key: 'codigo_sfca'
  has_many :atendimento, foreign_key: 'codigo_sfca'

  validates :codigo_sfca, presence: true
  validates :tabela, inclusion: { in: ['s', 'f', 'c', 'a'] }
  validates :codigo_situacao, presence: true
  validates :data, presence: true
end
