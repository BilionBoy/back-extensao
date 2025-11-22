# frozen_string_literal: true

class CreateGStatusPagamentos < ActiveRecord::Migration[7.2]
  unless table_exists? :g_status_pagamentos
   def up
    create_table :g_status_pagamentos do |t|
        t.string :descricao
      t.timestamps
    end
   end
  end

  def down
    drop_table :g_status_pagamentos if table_exists? :g_status_pagamentos
  end
end
