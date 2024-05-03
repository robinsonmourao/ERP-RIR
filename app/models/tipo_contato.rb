class TipoContato < ApplicationRecord
  self.table_name = 'tipo_contatos'

  attribute :codigo_tipo_contato, :integer
  attribute :descricao, :string

  has_many :contato

  validates :descricao, presence: true
end
