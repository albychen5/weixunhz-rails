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

ActiveRecord::Schema.define(version: 20160615063312) do

  create_table "attendees", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.integer  "event_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "attendees", ["event_id"], name: "index_attendees_on_event_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.text     "location"
    t.date     "date"
    t.text     "details"
    t.time     "event_time"
    t.integer  "group_id"
    t.text     "link"
  end

  add_index "events", ["group_id"], name: "index_events_on_group_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "follows", force: :cascade do |t|
    t.integer  "following_id", null: false
    t.integer  "follower_id",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id"
  add_index "follows", ["following_id", "follower_id"], name: "index_follows_on_following_id_and_follower_id", unique: true
  add_index "follows", ["following_id"], name: "index_follows_on_following_id"

  create_table "group_relationships", force: :cascade do |t|
    t.boolean  "admin"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_relationships", ["group_id"], name: "index_group_relationships_on_group_id"
  add_index "group_relationships", ["user_id"], name: "index_group_relationships_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "notified_by_id"
    t.integer  "event_id"
    t.integer  "identifier"
    t.string   "notice_type"
    t.boolean  "read",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "notifications", ["event_id"], name: "index_notifications_on_event_id"
  add_index "notifications", ["notified_by_id"], name: "index_notifications_on_notified_by_id"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "proposals", force: :cascade do |t|
    t.string   "name"
    t.text     "info"
    t.integer  "user_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "group_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "proposals", ["cached_votes_down"], name: "index_proposals_on_cached_votes_down"
  add_index "proposals", ["cached_votes_score"], name: "index_proposals_on_cached_votes_score"
  add_index "proposals", ["cached_votes_total"], name: "index_proposals_on_cached_votes_total"
  add_index "proposals", ["cached_votes_up"], name: "index_proposals_on_cached_votes_up"
  add_index "proposals", ["cached_weighted_average"], name: "index_proposals_on_cached_weighted_average"
  add_index "proposals", ["cached_weighted_score"], name: "index_proposals_on_cached_weighted_score"
  add_index "proposals", ["cached_weighted_total"], name: "index_proposals_on_cached_weighted_total"
  add_index "proposals", ["group_id"], name: "index_proposals_on_group_id"
  add_index "proposals", ["user_id"], name: "index_proposals_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "bio"
    t.string   "phone_number"
    t.string   "wechat_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true
  add_index "users", ["wechat_id"], name: "index_users_on_wechat_id", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
