class LocalPagamento < ApplicationRecord
  self.table_name = 'local_pagamentos'

  attribute :codigo_local_pagamento, :integer
  attribute :descricao, :integer

  has_many :boleto

  validates :descricao, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
