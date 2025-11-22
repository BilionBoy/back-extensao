# frozen_string_literal: true

class GStatusPagamento < ApplicationRecord
  
  validates :descricao, presence: true
  
end
