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

ActiveRecord::Schema.define(version: 20161205095412) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.string   "given_name",       limit: 255
    t.string   "given_name_kana",  limit: 255
    t.string   "family_name",      limit: 255
    t.string   "family_name_kana", limit: 255
    t.integer  "postal_code",      limit: 4
    t.string   "prefecture",       limit: 255
    t.string   "municipality",     limit: 255
    t.string   "street",           limit: 255
    t.string   "building",         limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "animals", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "animals", ["name"], name: "index_animals_on_name", unique: true, using: :btree

  create_table "announces", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.date     "start_dat"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "announces", ["book_id"], name: "index_announces_on_book_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "title",      limit: 255
    t.string   "author",     limit: 255
    t.integer  "status",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "books", ["user_id", "title", "author"], name: "index_books_on_user_id_and_title_and_author", unique: true, using: :btree
  add_index "books", ["user_id"], name: "index_books_on_user_id", using: :btree

  create_table "children", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.integer  "parent_id",  limit: 4
    t.text     "recommend",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "children", ["book_id"], name: "index_children_on_book_id", using: :btree
  add_index "children", ["parent_id"], name: "index_children_on_parent_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "announce_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "likes", ["announce_id"], name: "index_likes_on_announce_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "parent_child_id", limit: 4
    t.text     "content",         limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "messages", ["parent_child_id"], name: "index_messages_on_parent_child_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "parent_children", force: :cascade do |t|
    t.integer  "parent_id",      limit: 4
    t.integer  "child_id",       limit: 4
    t.boolean  "confirm_parent",           default: false
    t.boolean  "confirm_child",            default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "parent_children", ["child_id"], name: "index_parent_children_on_child_id", using: :btree
  add_index "parent_children", ["parent_id"], name: "index_parent_children_on_parent_id", using: :btree

  create_table "parents", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.datetime "deadline"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "parents", ["book_id"], name: "index_parents_on_book_id", using: :btree

  create_table "performances", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "evaluate",   limit: 4
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "performances", ["user_id"], name: "index_performances_on_user_id", using: :btree

  create_table "user_animals", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "animal_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_animals", ["animal_id"], name: "index_user_animals_on_animal_id", using: :btree
  add_index "user_animals", ["user_id"], name: "index_user_animals_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.date     "birthday"
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "announces", "books"
  add_foreign_key "books", "users"
  add_foreign_key "children", "books"
  add_foreign_key "children", "parents"
  add_foreign_key "likes", "announces"
  add_foreign_key "likes", "users"
  add_foreign_key "messages", "parent_children"
  add_foreign_key "messages", "users"
  add_foreign_key "parent_children", "children"
  add_foreign_key "parent_children", "parents"
  add_foreign_key "parents", "books"
  add_foreign_key "performances", "users"
  add_foreign_key "user_animals", "animals"
  add_foreign_key "user_animals", "users"
end
