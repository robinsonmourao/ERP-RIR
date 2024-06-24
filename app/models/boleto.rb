class Boleto < ApplicationRecord
  self.table_name = 'boletos'

  attribute :codigo_atendimento, :integer
  attribute :codigo_fatura, :integer
  attribute :codigo_grupo, :integer
  attribute :codigo_local_pagamento, :integer
  attribute :codigo_status, :integer
  attribute :vencimento, :date
  attribute :chave, :text
  attribute :data_pagamento, :date
  attribute :valor_pagamento, :decimal, precision: 11, scale: 2
  attribute :observacao, :text

  has_many :atendimento, foreign_key: 'codigo_atendimento'
  has_many :fatura, foreign_key: 'codigo_fatura'
  has_one :grupo, foreign_key: 'codigo_grupo'
  has_one :local_pagamento, foreign_key: 'codigo_local_pagamento'
  has_one :status, foreign_key: 'codigo_status'

  validates :codigo_atendimento, presence: true
  validates :codigo_fatura, presence: true
  validates :codigo_grupo, presence: true
end
