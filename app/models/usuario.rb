class Usuario < ApplicationRecord
  attribute :codigo_usuario, :integer
  attribute :password_digest, :string
  attribute :nome, :string
  attribute :permissao, :integer

  has_many :cliente
  has_many :fornecedor
  has_many :site
  has_many :atendimento
  has_many :fatura
  has_many :boletos

  validates :password, presence: true
  validates :nome, presence: true
  validates :permissao, presence: true, inclusion: { in: [1, 2, 3, 4] }

  has_secure_password
end
