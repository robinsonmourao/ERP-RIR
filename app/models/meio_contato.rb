class MeioContato < ApplicationRecord
  self.table_name = 'meio_contatos'

  attribute :codigo_meio_contato, :integer
  attribute :descricao, :string

  has_many :contato

  validates :descricao, presence: true, inclusion: { in: ['email', 'telefone', 'whatsapp'] }
end
