# frozen_string_literal: true

class CreateGBairros < ActiveRecord::Migration[6.0]
  unless table_exists? :g_bairros
    def up
      create_table :g_bairros do |t|
          t.string :descricao
        t.timestamps
      end
    end
  end

  def down
    drop_table :g_bairros if table_exists? :g_bairros
  end
end
