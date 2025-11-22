# frozen_string_literal: true

class CreateGBairros < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:g_bairros)
      create_table :g_bairros do |t|
        t.string :descricao
        t.timestamps
      end
    end
  end

  def down
    drop_table :g_bairros, if_exists: true
  end
end
