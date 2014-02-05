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

ActiveRecord::Schema.define(:version => 20140103120545) do

  create_table "ads", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "ads", ["user_id"], :name => "index_ads_on_user_id"

  create_table "apartment_counters", :force => true do |t|
    t.integer  "apartment_id"
    t.integer  "counter_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "apartment_counters", ["apartment_id"], :name => "index_apartment_counters_on_apartment_id"
  add_index "apartment_counters", ["counter_type_id"], :name => "index_apartment_counters_on_counter_type_id"

  create_table "apartments", :force => true do |t|
    t.integer  "entrance_number"
    t.integer  "floor"
    t.integer  "apartment_number"
    t.integer  "room_count"
    t.integer  "resident_count"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "counter_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "counter_types", ["name"], :name => "index_counter_types_on_name", :unique => true

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "documents", ["title"], :name => "index_documents_on_title", :unique => true
  add_index "documents", ["user_id"], :name => "index_documents_on_user_id"

  create_table "meterages", :force => true do |t|
    t.integer  "apartment_counter_id"
    t.integer  "monthly_reading_id"
    t.integer  "prev_id"
    t.decimal  "value",                :precision => 8, :scale => 3
    t.decimal  "value2",               :precision => 8, :scale => 3
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "meterages", ["apartment_counter_id", "monthly_reading_id"], :name => "index_meterages_on_apartment_counter_id_and_monthly_reading_id", :unique => true

  create_table "monthly_readings", :force => true do |t|
    t.date     "month"
    t.integer  "apartment_id"
    t.integer  "prev_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "monthly_readings", ["apartment_id", "month"], :name => "index_monthly_readings_on_apartment_id_and_month", :unique => true

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "Account",         :null => false
    t.string   "password_digest"
    t.string   "FirstName"
    t.string   "MiddleName"
    t.string   "LastName"
    t.string   "email"
    t.string   "role"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["Account"], :name => "index_users_on_Account", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
