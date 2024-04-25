class MidiaSocial < ApplicationRecord
  attribute :tabela, :string
  attribute :codigo_tipo_midia_social, :integer
  attribute :descricao, :string

  validates :tabela, presence: true, inclusion: { in: ['f', 'c'] }
  validates :descricao, presence: true

  has_one :tipo_midia_social, foreign_key: 'codigo_tipo_midia_social', optional: true
end
