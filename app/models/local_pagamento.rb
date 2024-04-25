class LocalPagamento < ApplicationRecord
  attribute :codigo_local_pagamento, :integer
  attribute :descricao, :integer

  belongs_to :boleto
  
  validates :descricao, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
