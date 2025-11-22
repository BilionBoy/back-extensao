# frozen_string_literal: true

class GBairro < ApplicationRecord
  validates :descricao, presence: true
end
