class TecnologiaLink < ApplicationRecord
  self.table_name = 'tecnologia_links'

  attribute :codigo_tecnologia_link, :integer
  attribute :descricao, :string

  has_many :atendimento

  validates :descricao, presence: true, uniqueness: true
end
