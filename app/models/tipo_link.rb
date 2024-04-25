class TipoLink < ApplicationRecord
  attribute :codigo_tipo_link, :integer
  attribute :descricao, :integer

  validates :descricao, presence: true, inclusion: { in: [1, 2, 3] }
end
