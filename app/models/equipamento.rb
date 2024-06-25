class Equipamento < ApplicationRecord
  self.table_name = 'equipamentos'

  attribute :codigo_equipamento, :integer
  attribute :descricao, :string
  attribute :mac_equipamento, :string
  attribute :serial_equipamento, :string

  has_one :atendimento

  validates :descricao, presence: true, uniqueness: true
end
