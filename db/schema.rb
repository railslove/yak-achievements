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

ActiveRecord::Schema.define(:version => 20130603223035) do

  create_table "achieved_achievements", :force => true do |t|
    t.integer  "achievement_id", :null => false
    t.integer  "squid_card_id",  :null => false
    t.string   "value"
    t.datetime "achieved_at"
  end

  add_index "achieved_achievements", ["achievement_id"], :name => "index_achieved_achievements_on_achievement_id"
  add_index "achieved_achievements", ["squid_card_id", "achievement_id"], :name => "index_achieved_achievements_on_squid_card_id_and_achievement_id", :unique => true
  add_index "achieved_achievements", ["squid_card_id"], :name => "index_achieved_achievements_on_squid_card_id"

  create_table "achievements", :force => true do |t|
    t.string   "title",       :null => false
    t.integer  "resource_id", :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "achievements", ["resource_id"], :name => "index_achievements_on_resource_id"

  create_table "resources", :force => true do |t|
    t.string   "key",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "resources", ["key"], :name => "index_resources_on_key", :unique => true

  create_table "squid_cards", :force => true do |t|
    t.string   "uid",        :limit => 40, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "squid_cards", ["uid"], :name => "index_squid_cards_on_uid", :unique => true

end
