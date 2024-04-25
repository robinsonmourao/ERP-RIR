class ContatoMeio < ApplicationRecord
  attribute :codigo_contato_meio, :integer
  attribute :descricao, :string

  belongs_to :contato

  validates :descricao, presence: true, inclusion: { in: ['email', 'telefone', 'whatsapp'] }
end
