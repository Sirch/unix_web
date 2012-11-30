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

ActiveRecord::Schema.define(:version => 20121130143535) do

  create_table "changes", :force => true do |t|
    t.string   "added_by"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.text     "subject"
  end

  create_table "cpus", :force => true do |t|
    t.string   "processor"
    t.string   "model"
    t.integer  "core_count"
    t.integer  "base_speed_mhz"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "datacenters", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "postcode"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "operating_systems", :force => true do |t|
    t.string   "name"
    t.string   "version"
    t.string   "release"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "comment"
  end

  create_table "server_models", :force => true do |t|
    t.string   "name"
    t.string   "manufacturer"
    t.integer  "uheight"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "power"
    t.integer  "power_sockets"
    t.integer  "heat_dissipation"
  end

  create_table "server_racks", :force => true do |t|
    t.string   "name"
    t.integer  "datacenter_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "servers", :force => true do |t|
    t.string   "name"
    t.boolean  "virtual"
    t.integer  "parent_id"
    t.integer  "datacenter_id"
    t.string   "serial"
    t.integer  "server_rack_id"
    t.integer  "server_model_id"
    t.integer  "cpu_number"
    t.integer  "cpu_id"
    t.integer  "ram"
    t.string   "environment"
    t.integer  "responsible_team_id"
    t.integer  "project_id"
    t.string   "oob_address"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "usage"
    t.string   "operating_system"
    t.integer  "added_by"
    t.integer  "edited_by"
    t.string   "cpu_type"
  end

  add_index "servers", ["name"], :name => "index_servers_on_name"
  add_index "servers", ["parent_id"], :name => "index_servers_on_parent_id"
  add_index "servers", ["project_id"], :name => "index_servers_on_project_id"
  add_index "servers", ["server_rack_id"], :name => "index_servers_on_server_rack_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "vclusters", :force => true do |t|
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
