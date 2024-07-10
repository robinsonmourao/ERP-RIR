class Situacao < ApplicationRecord
  self.table_name = 'situacoes'

  attribute :codigo_situacao, :integer
  attribute :descricao, :string

  validates :descricao, presence: true, uniqueness: true
end
