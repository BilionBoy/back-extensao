# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_11_22_034352) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "g_bairros", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_clientes", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "cpf"
    t.string "rg"
    t.date "data_nascimento"
    t.string "endereco_residencial"
    t.string "local_entrega"
    t.bigint "g_bairro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_g_clientes_on_cpf", unique: true
    t.index ["g_bairro_id"], name: "index_g_clientes_on_g_bairro_id"
  end

  create_table "g_formas_pagamento", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_itens", force: :cascade do |t|
    t.string "descricao"
    t.decimal "valor_diaria", precision: 10, scale: 2
    t.decimal "valor_semanal", precision: 10, scale: 2
    t.decimal "valor_mensal", precision: 10, scale: 2
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_status_pagamentos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nome", null: false
    t.string "cpf", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_users_on_cpf", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "g_clientes", "g_bairros"
end
