class FornecedorCidade < ApplicationRecord
  self.table_name = 'fornecedor_cidades'

  attribute :codigo_fornecedor, :integer
  attribute :codigo_municipio, :integer
  attribute :area, :integer
  attribute :observacao, :text

  has_one :fornecedor, foreign_key: 'codigo_fornecedor'
  has_many :municipio, foreign_key: 'codigo_municipio'

  validates :area, inclusion: { in: [0, 1, 2, 3] }
end
