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

ActiveRecord::Schema.define(version: 2019_11_04_111941) do

  create_table "admins", force: :cascade do |t|
    t.text "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "codes", force: :cascade do |t|
    t.text "photo"
    t.text "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_codes_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_codes_on_user_id"
  end

  create_table "codetags", force: :cascade do |t|
    t.integer "code_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id", "tag_id"], name: "index_codetags_on_code_id_and_tag_id", unique: true
    t.index ["code_id"], name: "index_codetags_on_code_id"
    t.index ["tag_id"], name: "index_codetags_on_tag_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "code_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.text "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "code_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.text "tagname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tagname"], name: "index_tags_on_tagname", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text "name"
    t.text "gender"
    t.integer "age"
    t.integer "height"
    t.text "password"
    t.text "profile_image"
    t.boolean "deleted_flag", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
