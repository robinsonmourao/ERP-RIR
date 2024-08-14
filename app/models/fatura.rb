class Fatura < ApplicationRecord
  self.table_name = 'faturas'

  attribute :codigo_fatura, :integer
  attribute :codigo_atendimento_composto, :text
  attribute :codigo_meio_pagamento, :integer
  attribute :codigo_status, :integer
  attribute :chave, :text
  attribute :valor, :text
  attribute :vencimento, :date, default: -> { Date.current.change(day: 25) }
  attribute :descricao_grupo, :text
  attribute :instalacao, :integer, default: 0

  has_one :meio_pagamento, foreign_key: 'codigo_meio_pagamento'
  # has_one :grupo, foreign_key: 'descricao_grupo'
  has_one :status, foreign_key: 'codigo_status'

  validates :codigo_atendimento_composto, presence: true
  validates :codigo_meio_pagamento, presence: true
  validates :descricao_grupo, presence: true
  validates :codigo_status, presence: true
  validates :instalacao, inclusion: { in: [0, 1] }

  before_save :format_values

  def format_values
    self.valor = format_value_to_currency_real(valor)
  end
end
