# frozen_string_literal: true

class CreateGFormasPagamento < ActiveRecord::Migration[7.2]
  unless table_exists?(:g_formas_pagamento)
   def up
    create_table :g_formas_pagamento do |t|
      t.string :descricao
      t.timestamps
    end
   end
  end

  def down
    drop_table :g_formas_pagamento if table_exists? :g_formas_pagamento
  end
end
