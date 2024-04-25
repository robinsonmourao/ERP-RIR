class Contato < ApplicationRecord
  self.table_name = 'contatos'

  attribute :tabela, :string
  attribute :codigo_contato_tipo, :integer
  attribute :codigo_contato_meio, :integer
  attribute :nome_pessoa, :text
  attribute :descricao, :text
  attribute :observacao, :text

  has_one :contato_tipo, foreign_key: 'codigo_contato_tipo'
  has_one :contato_meio, foreign_key: 'codigo_contato_meio'

  validates :tabela, inclusion: { in: ['s', 'f', 'c'] }
  validates :codigo_contato_tipo, presence: true
  validates :codigo_contato_meio, presence: true
  validates :descricao, presence: true
end
