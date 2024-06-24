class MeioPagamento < ApplicationRecord
  self.table_name = 'meio_pagamentos'

  attribute :codigo_meio_pagamento, :integer
  attribute :descricao, :string

  has_many :fatura
  has_many :atendimento

  validates :descricao, presence: true, uniqueness: true
end
