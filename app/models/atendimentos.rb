class Atendimento < ApplicationRecord
  self.table_name = 'atendimentos'

  attribute :designacao, :integer
  attribute :codigo_fornecedor, :integer
  attribute :codigo_tipo_tecnologia, :integer
  attribute :codigo_tipo_link, :integer
  attribute :velocidade_down, :integer
  attribute :velocidade_up, :integer
  attribute :ip, :text
  attribute :ip_fixo, :text
  attribute :pppoe_login, :text
  attribute :pppoe_senha, :text
  attribute :link, :text
  attribute :dia_vencimento, :integer, default: 25
  attribute :valor_Mensal, :decimal, precision: 11, scale: 2
  attribute :valor_instalacao, :decimal, precision: 11, scale: 2
  attribute :codigo_meio_pagamento, :integer
  attribute :chave_pix, :text
  attribute :nota_fiscal, :integer, default: 0
  attribute :codigo_equipamento, :integer

  belongs_to :site, foreign_key: 'designacao'
  belongs_to :fornecedor, foreign_key: 'codigo_fornecedor'
  belongs_to :tipo_tecnologia, foreign_key: 'codigo_tipo_tecnologia'
  belongs_to :tipo_link, foreign_key: 'codigo_tipo_link'
  belongs_to :meio_pagamento, foreign_key: 'codigo_meio_pagamento'
  belongs_to :equipamento, foreign_key: 'codigo_equipamento'

  validates :designacao, presence: true
  validates :codigo_fornecedor, presence: true
  validates :codigo_tipo_tecnologia, presence: true
  validates :codigo_tipo_link, presence: true
  validates :velocidade_down, presence: true, numericality: { greater_than: 0 }
  validates :velocidade_up, numericality: { greater_than: 0 }, allow_nil: true
  validates :ip, inclusion: { in: ['Fixo', 'Dinamico'] }
  validates :link, inclusion: { in: ['principal', 'backup'] }
  validates :nota_fiscal, inclusion: { in: [0, 1] }
end
