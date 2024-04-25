class Equipamento < ApplicationRecord
  attribute :codigo_equipamento, :integer
  attribute :descricao, :integer
  attribute :mac_equipamento, :string
  attribute :serial_equipamento, :string

  validates :descricao, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
