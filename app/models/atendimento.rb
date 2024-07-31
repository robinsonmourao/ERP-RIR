class Atendimento < ApplicationRecord
  self.table_name = 'atendimentos'

  attribute :codigo_atendimento, :integer
  attribute :designacao, :text
  attribute :nome_fornecedor, :text
  attribute :codigo_tecnologia_link, :integer
  attribute :codigo_tipo_link, :integer
  attribute :velocidade_down, :decimal
  attribute :velocidade_up, :decimal
  attribute :ip, :integer, default: 2
  attribute :ip_fixo, :text
  attribute :pppoe_login, :text
  attribute :pppoe_senha, :text
  attribute :link, :integer, default: 1
  attribute :dia_vencimento, :integer, default: 25
  attribute :valor_mensal, :text
  attribute :valor_instalacao, :text
  attribute :codigo_meio_pagamento, :integer
  attribute :chave_pix, :text
  attribute :nota_fiscal, :integer, default: 0
  attribute :codigo_equipamento, :integer

  has_one :tipo_link, foreign_key: 'codigo_tipo_link'
  has_one :tipo_tecnologia, foreign_key: 'codigo_tipo_tecnologia'
  has_one :meio_pagamento, foreign_key: 'codigo_meio_pagamento'
  has_many :equipamento, foreign_key: 'codigo_equipamento'

  validates :designacao, presence: true
  validates :nome_fornecedor, presence: true
  validates :velocidade_down, presence: true
  validates :ip, presence: true, inclusion: { in: [1, 2] }
  validates :link, inclusion: { in: [1, 2] }
  validates :nota_fiscal, inclusion: { in: [0, 1] }

  before_validation :set_default_dia_vencimento, on: [:create, :update]
  before_save :format_values

  def format_values
    self.valor_mensal = format_value_to_currency_real(valor_mensal)
    self.valor_instalacao = format_value_to_currency_real(valor_instalacao)
  end

  private

  def set_default_dia_vencimento
    self.dia_vencimento ||= 25
  end
end
