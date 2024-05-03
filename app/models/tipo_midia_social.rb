class TipoMidiaSocial < ApplicationRecord
  self.table_name = 'tipo_midias_sociais'

  attribute :codigo_tipo_midia, :integer
  attribute :descricao, :string

  has_many :midia_social

  validates :descricao, presence: true
end
