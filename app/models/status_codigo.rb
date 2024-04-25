class StatusCodigo < ApplicationRecord
  self.table_name = 'status_codigo'

  attribute :codigo_status_codigo, :integer
  attribute :descricao, :text, default: 'pendente'

  validates :descricao, presence: true, inclusion: { in: ['ativo', 'cancelado', 'suspenso', 'bloqueado', 'pendente'] }
end
