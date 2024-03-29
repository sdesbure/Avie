# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120517154330) do

  create_table "account_units", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "morningstar_url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "brokers", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "euro_funds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "insurers", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "life_insurance_contracts", :force => true do |t|
    t.integer  "life_insurance_id"
    t.integer  "user_id"
    t.string   "contract_number"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "life_insurance_contracts", ["life_insurance_id"], :name => "index_life_insurance_contracts_on_life_insurance_id"
  add_index "life_insurance_contracts", ["user_id"], :name => "index_life_insurance_contracts_on_user_id"

  create_table "life_insurances", :force => true do |t|
    t.integer  "broker_id"
    t.integer  "insurer_id"
    t.string   "name"
    t.string   "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "life_insurances", ["broker_id"], :name => "index_life_insurances_on_broker_id"
  add_index "life_insurances", ["insurer_id"], :name => "index_life_insurances_on_insurer_id"

  create_table "positions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "support_id"
    t.string   "support_type",               :default => "AccountUnit"
    t.integer  "life_insurance_contract_id"
    t.float    "buy_price"
    t.float    "sell_price"
    t.float    "price_paid"
    t.date     "buy_date"
    t.date     "sell_date"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "positions", ["life_insurance_contract_id"], :name => "index_positions_on_life_insurance_contract_id"
  add_index "positions", ["support_id"], :name => "index_positions_on_support_id"
  add_index "positions", ["user_id"], :name => "index_positions_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
