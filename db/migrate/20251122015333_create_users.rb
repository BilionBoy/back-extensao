class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    return if table_exists?(:users)

    create_table :users do |t|
      t.string :nome, null: false
      t.string :cpf, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end

    add_index :users, :cpf, unique: true
    add_index :users, :email, unique: true
  end
end
