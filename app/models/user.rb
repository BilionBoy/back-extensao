class User < ApplicationRecord
  has_secure_password

  validates :nome,  presence: true
  validates :cpf,   presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
