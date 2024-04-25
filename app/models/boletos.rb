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
  attribute :local_pagamento, :integer
  attribute :observacao, :text
  attribute :status, :integer

  belongs_to :fatura, foreign_key: 'codigo_fatura'
  belongs_to :atendimento, foreign_key: 'codigo_atendimento'
  belongs_to :grupo, foreign_key: 'codigo_grupo'

  validates :codigo_fatura, presence: true
  validates :codigo_atendimento, presence: true
  validates :vencimento, presence: true
  validates :codigo_grupo, presence: true
  validates :grupo, presence: true
  validates :status, presence: true
end
