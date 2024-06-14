class Status < ApplicationRecord
  self.table_name = 'statuses'

  attribute :codigo_status, :integer
  attribute :codigo_acfs, :integer
  attribute :codigo_acfs_composto, :string
  attribute :tabela, :string
  attribute :codigo_situacao, :integer
  attribute :data, :date

  has_one :situacao

  validates :codigo_acfs, presence: true
  validates :codigo_acfs_composto, uniqueness: true
  validates :tabela, presence: true, inclusion: { in: ['a', 'c', 'f', 's'] }
  validates :codigo_situacao, presence: true
end
