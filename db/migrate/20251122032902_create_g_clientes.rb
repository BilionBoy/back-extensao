# frozen_string_literal: true

class CreateGClientes < ActiveRecord::Migration[7.2]
  def up
    return if table_exists?(:g_clientes)

    create_table :g_clientes do |t|
      t.string  :nome
      t.string  :telefone
      t.string  :cpf
      t.string  :rg
      t.date    :data_nascimento
      t.string  :endereco_residencial
      t.string  :local_entrega

      t.references :g_bairro, foreign_key: true

      t.timestamps
    end

    add_index :g_clientes, :cpf, unique: true
  end

  def down
    drop_table :g_clientes if table_exists?(:g_clientes)
  end
end
