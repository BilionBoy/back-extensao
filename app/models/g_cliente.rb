# frozen_string_literal: true

class GCliente < ApplicationRecord
  belongs_to :g_bairro, optional: true

  validates :nome,     presence: true
  validates :telefone, presence: true
  validates :cpf,      presence: true, uniqueness: true
end
