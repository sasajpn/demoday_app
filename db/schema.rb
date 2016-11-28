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

ActiveRecord::Schema.define(version: 20161128214724) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "postal_code",  limit: 4
    t.string   "prefecture",   limit: 255
    t.string   "municipality", limit: 255
    t.string   "street",       limit: 255
    t.string   "building",     limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "animals", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "animals", ["name"], name: "index_animals_on_name", unique: true, using: :btree

  create_table "announces", force: :cascade do |t|
    t.integer  "user_book_id", limit: 4
    t.date     "start_day"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "announces", ["user_book_id"], name: "index_announces_on_user_book_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "authors", ["name"], name: "index_authors_on_name", unique: true, using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "author_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
  add_index "books", ["title"], name: "index_books_on_title", unique: true, using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "announce_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "likes", ["announce_id"], name: "index_likes_on_announce_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "parent_wants", force: :cascade do |t|
    t.integer  "user_book_id", limit: 4
    t.integer  "parent_id",    limit: 4
    t.text     "recommend",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "parent_wants", ["parent_id"], name: "index_parent_wants_on_parent_id", using: :btree
  add_index "parent_wants", ["user_book_id"], name: "index_parent_wants_on_user_book_id", using: :btree

  create_table "parents", force: :cascade do |t|
    t.integer  "user_book_id", limit: 4
    t.date     "deadline"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "parents", ["user_book_id"], name: "index_parents_on_user_book_id", using: :btree

  create_table "user_animals", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "animal_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_animals", ["animal_id"], name: "index_user_animals_on_animal_id", using: :btree
  add_index "user_animals", ["user_id"], name: "index_user_animals_on_user_id", using: :btree

  create_table "user_book_wants", force: :cascade do |t|
    t.integer  "parent_id",      limit: 4
    t.integer  "parent_want_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "user_book_wants", ["parent_id"], name: "index_user_book_wants_on_parent_id", using: :btree
  add_index "user_book_wants", ["parent_want_id"], name: "index_user_book_wants_on_parent_want_id", using: :btree

  create_table "user_books", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "status",     limit: 4
    t.boolean  "parent",               default: false, null: false
    t.boolean  "child",                default: false, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "user_books", ["book_id"], name: "index_user_books_on_book_id", using: :btree
  add_index "user_books", ["user_id"], name: "index_user_books_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name",              limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.date     "birthday"
    t.string   "given_name",             limit: 255
    t.string   "given_name_kana",        limit: 255
    t.string   "family_name",            limit: 255
    t.string   "family_namee_kana",      limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
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
  add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "announces", "user_books"
  add_foreign_key "books", "authors"
  add_foreign_key "likes", "announces"
  add_foreign_key "likes", "users"
  add_foreign_key "parent_wants", "parents"
  add_foreign_key "parent_wants", "user_books"
  add_foreign_key "parents", "user_books"
  add_foreign_key "user_animals", "animals"
  add_foreign_key "user_animals", "users"
  add_foreign_key "user_book_wants", "parent_wants"
  add_foreign_key "user_book_wants", "parents"
  add_foreign_key "user_books", "books"
  add_foreign_key "user_books", "users"
end
