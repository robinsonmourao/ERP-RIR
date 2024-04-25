class ContatoMeio < ApplicationRecord
  attribute :codigo_contato_meio, :integer
  attribute :descricao, :string

  validates :descricao, presence: true, inclusion: { in: ['email', 'telefone', 'whatsapp'] }
end
