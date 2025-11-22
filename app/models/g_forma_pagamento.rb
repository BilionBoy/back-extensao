# frozen_string_literal: true

class GFormaPagamento < ApplicationRecord
  validates :descricao, presence: true
end
