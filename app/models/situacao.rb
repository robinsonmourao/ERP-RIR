class Situacao < ApplicationRecord
  self.table_name = 'situacoes'

  attribute :codigo_situacao, :integer
  attribute :descricao, :integer, default: 5

  validates :codigo_situacao, presence: true
  validates :descricao, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
