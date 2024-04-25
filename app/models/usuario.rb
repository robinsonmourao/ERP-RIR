class Usuario < ApplicationRecord
  attribute :codigo_usuario, :integer
  attribute :senha, :string
  attribute :nome, :string
  attribute :permissao, :integer

  validates :senha, presence: true
  validates :nome, presence: true
  validates :permissao, presence: true, inclusion: { in: [1, 2, 3, 4] }
end
