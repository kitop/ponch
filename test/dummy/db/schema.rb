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

ActiveRecord::Schema.define(:version => 20120125234750) do

  create_table "ponch_deliveries", :force => true do |t|
    t.string   "to",         :null => false
    t.string   "from",       :null => false
    t.string   "subject"
    t.string   "code",       :null => false
    t.datetime "sent_at",    :null => false
    t.datetime "opened_at"
    t.string   "opened_ip"
    t.datetime "clicked_at"
    t.string   "clicked_ip"
  end

  add_index "ponch_deliveries", ["code"], :name => "index_ponch_deliveries_on_code", :unique => true

end
