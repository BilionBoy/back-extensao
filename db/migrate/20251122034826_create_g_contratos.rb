class CreateGContratos < ActiveRecord::Migration[7.2]
  unless table_exists? :g_contratos
    def up
      create_table :g_contratos do |t|
        t.date :data_entrega
        t.date :data_devolucao
        t.text :observacoes
        t.references :g_cliente,          null: false, foreign_key: true
        t.references :g_status_pagamento, null: false, foreign_key: true
        t.references :g_forma_pagamento,  null: false, foreign_key: true

        t.timestamps
      end
    end
  end

  def down
    drop_table :g_contratos if table_exists? :g_contratos
  end
end
