# frozen_string_literal: true

class GItem < ApplicationRecord
  
  validates :descricao, presence: true
  
end
