class TipoMidiaSocial < ApplicationRecord
  attribute :codigo_tipo_midia, :integer
  attribute :descricao, :string

  belongs_to :midia_social

  validates :descricao, presence: true
end
