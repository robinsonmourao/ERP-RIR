class Equipamento < ApplicationRecord
  self.table_name = 'equipamentos'

  attribute :codigo_equipamento, :integer
  attribute :descricao, :integer
  attribute :mac_equipamento, :string
  attribute :serial_equipamento, :string

  has_one :atendimento

  validates :descricao, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
