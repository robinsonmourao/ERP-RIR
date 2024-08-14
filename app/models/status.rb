class Status < ApplicationRecord
  self.table_name = 'statuses'

  attribute :codigo_status, :integer
  attribute :descricao_acfs, :text
  attribute :codigo_acfs_composto, :string
  attribute :tabela, :string
  attribute :codigo_situacao, :integer
  attribute :data, :date

  has_one :situacao

  validates :descricao_acfs, presence: true
  validates :codigo_acfs_composto, uniqueness: true
  validates :tabela, presence: true, inclusion: { in: ['a', 'c', 'f', 's'] }

  before_validation :set_default_codigo_situacao, on: [:create, :update]

  private

  def set_default_codigo_situacao
    self.codigo_situacao ||= 5
  end
end
