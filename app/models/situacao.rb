class Situacao < ApplicationRecord
  self.table_name = 'situacao'

  attribute :codigo_situacao, :integer
  attribute :descricao, :text, default: 'pendente'

  has_many :status

  validates :codigo_situacao, presence: true
  validates :descricao, presence: true, inclusion: { in: ['ativo', 'cancelado', 'suspenso', 'bloqueado', 'pendente'] }
end
