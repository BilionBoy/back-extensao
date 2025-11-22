# frozen_string_literal: true

class CreateGContratosItens < ActiveRecord::Migration[7.2]
  def up
    return if table_exists?(:g_contratos_itens)

    create_table :g_contratos_itens do |t|
      t.references :g_contrato, foreign_key: true
      t.references :g_item, foreign_key: true
      t.integer    :quantidade

      t.timestamps
    end
  end

  def down
    drop_table :g_contratos_itens if table_exists?(:g_contratos_itens)
  end
end
