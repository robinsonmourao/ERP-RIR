class Fatura < ApplicationRecord
  self.table_name = 'faturas'

  attribute :codigo_fatura, :integer
  attribute :codigo_atendimento, :integer
  attribute :codigo_meio_pagamento, :integer
  attribute :codigo_status, :integer
  attribute :chave, :text
  attribute :valor, :text
  attribute :vencimento, :date, default: -> { Date.current.change(day: 25) }
  attribute :codigo_grupo, :integer
  attribute :instalacao, :integer, default: 0

  has_one :atendimento, foreign_key: 'codigo_atendimento'
  has_one :meio_pagamento, foreign_key: 'codigo_meio_pagamento'
  has_one :grupo, foreign_key: 'codigo_grupo'
  has_one :status, foreign_key: 'codigo_status'

  validates :codigo_atendimento, presence: true
  validates :codigo_meio_pagamento, presence: true
  validates :codigo_grupo, presence: true
  validates :codigo_status, presence: true
  validates :instalacao, inclusion: { in: [0, 1] }

  before_save :format_values

  def format_values
    self.valor = format_value_to_currency_real(valor)
  end
end
