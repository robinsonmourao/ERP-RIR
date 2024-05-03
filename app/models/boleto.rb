class Boleto < ApplicationRecord
  self.table_name = 'boletos'

  attribute :codigo_fatura, :integer
  attribute :codigo_atendimento, :integer
  attribute :vencimento, :integer
  attribute :codigo_grupo, :integer
  attribute :grupo, :integer
  attribute :valor, :decimal, precision: 11, scale: 2
  attribute :chave, :text
  attribute :data_pagamento, :date
  attribute :codigo_local_pagamento, :integer
  attribute :observacao, :text
  attribute :status, :integer

  has_many :fatura, foreign_key: 'codigo_fatura'
  has_many :atendimento, foreign_key: 'codigo_atendimento'
  has_one :grupo, foreign_key: 'codigo_grupo'
  has_one :local_pagamento, foreign_key: 'codigo_local_pagamento'

  validates :codigo_fatura, presence: true
  validates :codigo_atendimento, presence: true
  validates :vencimento, presence: true
  validates :codigo_grupo, presence: true
  validates :grupo, presence: true
  validates :status, presence: true
end
