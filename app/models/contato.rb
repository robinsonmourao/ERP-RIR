class Contato < ApplicationRecord
  self.table_name = 'contatos'

  attribute :codigo_contato_composto, :string
  attribute :codigo_contato, :integer
  attribute :tabela, :string
  attribute :codigo_tipo_contato, :integer
  attribute :codigo_meio_contato, :integer
  attribute :nome_pessoa, :text
  attribute :descricao, :text
  attribute :observacao, :text

  has_one :tipo_contato, foreign_key: 'codigo_tipo_contato'
  has_one :meio_contato, foreign_key: 'codigo_meio_contato'

  validates :tabela, inclusion: { in: ['s', 'f', 'c'] }
  validates :codigo_tipo_contato, presence: true
  validates :codigo_meio_contato, presence: true
  validates :descricao, presence: true
end
