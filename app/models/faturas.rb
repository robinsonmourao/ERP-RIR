class Fatura < ApplicationRecord
  self.table_name = 'faturas'

  attribute :codigo_fatura, :integer
  attribute :codigo_atendimento, :integer
  attribute :codigo_meio_pagamento, :integer
  attribute :chave, :text
  attribute :valor, :decimal, precision: 11, scale: 2
  attribute :vencimento, :date
  attribute :codigo_grupo, :integer
  attribute :instalacao, :integer, default: 0
  attribute :codigo_status, :integer

  belongs_to :atendimento, foreign_key: 'codigo_atendimento'
  belongs_to :meio_pagamento, foreign_key: 'codigo_meio_pagamento'
  belongs_to :grupo, foreign_key: 'codigo_grupo'
  belongs_to :status, foreign_key: 'codigo_status'

  validates :codigo_atendimento, presence: true
  validates :codigo_meio_pagamento, presence: true
  validates :codigo_grupo, presence: true
  validates :codigo_status, presence: true
  validates :instalacao, inclusion: { in: [0, 1] }
end
