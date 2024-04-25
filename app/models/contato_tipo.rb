class ContatoTipo < ApplicationRecord
  attribute :codigo_contato_tipo, :integer
  attribute :descricao, :string

  validates :descricao, presence: true
end
