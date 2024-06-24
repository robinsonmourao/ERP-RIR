class LocalPagamento < ApplicationRecord
  self.table_name = 'local_pagamentos'

  attribute :codigo_local_pagamento, :integer
  attribute :descricao, :string

  has_many :boleto

  validates :descricao, presence: true, uniqueness: true
end
