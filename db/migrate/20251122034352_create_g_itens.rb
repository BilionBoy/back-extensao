# frozen_string_literal: true

class CreateGItens < ActiveRecord::Migration[7.2]
  def up
    return if table_exists?(:g_itens)

    create_table :g_itens do |t|
      t.string  :descricao
      t.decimal :valor_diaria,  precision: 10, scale: 2
      t.decimal :valor_semanal, precision: 10, scale: 2
      t.decimal :valor_mensal,  precision: 10, scale: 2
      t.boolean :ativo, default: true

      t.timestamps
    end
  end

  def down
    drop_table :g_itens if table_exists?(:g_itens)
  end
end
