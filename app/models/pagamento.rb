class MeioPagamento < ApplicationRecord
  self.table_name = 'meios_pagamento'

  attribute :codigo_meio_pagamento, :integer
  attribute :descricao, :integer, default: 1

  has_many :fatura, foreign_key: 'codigo_meio_pagamento'

  validates :descricao, inclusion: { in: [1, 2] }
end
