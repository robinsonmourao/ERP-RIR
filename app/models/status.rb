class Status < ApplicationRecord
  self.table_name = 'status'

  attribute :codigo_status, :integer
  attribute :codigo_sfca, :string
  attribute :tabela, :string
  attribute :situacao, :integer
  attribute :data, :date

  belongs_to :site, foreign_key: 'codigo_sfca'
  belongs_to :fornecedor, foreign_key: 'codigo_sfca'
  belongs_to :cliente, foreign_key: 'codigo_sfca'
  belongs_to :atendimento, foreign_key: 'codigo_sfca'

  validates :codigo_sfca, presence: true
  validates :tabela, inclusion: { in: ['s', 'f', 'c', 'a'] }
  validates :situacao, presence: true
  validates :data, presence: true
end
