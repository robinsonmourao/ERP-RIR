class TipoMidiaSocial < ApplicationRecord
  attribute :codigo_tipo_midia_social, :integer
  attribute :descricao, :string

  validates :descricao, presence: true
end
