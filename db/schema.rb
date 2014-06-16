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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140616041814) do

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "artists", force: true do |t|
    t.text     "name",          limit: 255
    t.integer  "soundcloud_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "ticket_id"
    t.text     "ticket_url",        limit: 255
    t.datetime "date"
    t.string   "status"
    t.string   "price"
    t.string   "age"
    t.text     "headliner_name",    limit: 255
    t.text     "support_name",      limit: 255
    t.string   "facebook_event_id"
    t.string   "ticket_source"
    t.text     "venue_event_url",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
  end

  create_table "tracks", force: true do |t|
    t.integer  "artist_id"
    t.integer  "sc_id"
    t.integer  "duration"
    t.text     "sc_permalink_uri",     limit: 255
    t.boolean  "sc_streamable"
    t.string   "sc_embeddable_by"
    t.string   "sc_genre"
    t.text     "sc_title",             limit: 255
    t.text     "title",                limit: 255
    t.text     "sc_artwork_url",       limit: 255
    t.text     "sc_stream_url",        limit: 255
    t.integer  "sc_playback_count"
    t.integer  "sc_favoritings_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.string   "genre"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "genres"
    t.string   "ambiance"
    t.integer  "price"
    t.string   "neighborhood"
    t.string   "age"
    t.string   "ticket_source"
    t.text     "ticket_venue_url",   limit: 255
    t.text     "venue_url",          limit: 255
    t.text     "yelp_url",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ticketfly_venue_id"
  end

end
