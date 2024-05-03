class TipoLink < ApplicationRecord
  self.table_name = 'tipo_links'

  attribute :codigo_tipo_link, :integer
  attribute :descricao, :integer

  has_many :site
  has_many :atendimento

  validates :descricao, presence: true, inclusion: { in: [1, 2, 3] }
end
