class ContatoTipo < ApplicationRecord
  attribute :codigo_contato_tipo, :integer
  attribute :descricao, :string

  belongs_to :contato

  validates :descricao, presence: true
end
