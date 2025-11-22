# frozen_string_literal: true

class GCliente < ApplicationRecord
  belongs_to :g_bairro

  validates :nome,                 presence: true
  validates :telefone,             presence: true
  validates :cpf,                  presence: true, uniqueness: true
  validates :rg,                   presence: true
  validates :data_nascimento,      presence: true
  validates :endereco_residencial, presence: true
  validates :local_entrega,        presence: true
  validates :g_bairro_id,          presence: true
end
