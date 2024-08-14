class Boleto < ApplicationRecord
  self.table_name = 'boletos'

  attribute :codigo_fatura, :integer
  attribute :codigo_atendimento_composto, :text
  attribute :descricao_grupo, :text
  attribute :codigo_local_pagamento, :integer
  attribute :codigo_status, :integer
  attribute :vencimento, :date
  attribute :chave, :text
  attribute :data_pagamento, :date
  attribute :valor_pagamento, :text
  attribute :observacao, :text

  # has_many :atendimento, foreign_key: 'codigo_atendimento'
  has_many :fatura, foreign_key: 'codigo_fatura'
  # has_one :grupo, foreign_key: 'codigo_grupo'
  has_one :local_pagamento, foreign_key: 'codigo_local_pagamento'
  has_one :status, foreign_key: 'codigo_status'

  validates :codigo_atendimento_composto, presence: true
  validates :codigo_fatura, presence: true
  validates :descricao_grupo, presence: true

  before_save :format_values

  def format_values
    self.valor_pagamento = format_value_to_currency_real(valor_pagamento)
  end
end
