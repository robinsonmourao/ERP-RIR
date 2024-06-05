class TipoLink < ApplicationRecord
  self.table_name = 'tipo_links'

  attribute :codigo_tipo_link, :integer
  attribute :descricao, :string

  has_many :site
  # has_many :atendimento

  validates :descricao, presence: true, uniqueness: true, inclusion: { in: ['IP dedicado', 'Banda Larga', 'VPN'] }
end
