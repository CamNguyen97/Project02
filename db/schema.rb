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

ActiveRecord::Schema.define(version: 20180423143811) do

  create_table "cinemarooms", force: :cascade do |t|
    t.string "name"
    t.text "descreption"
    t.boolean "status"
    t.integer "schedule_id"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_cinemarooms_on_schedule_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.date "year_produced"
    t.integer "broadcasting_time"
    t.text "descreption"
    t.string "trailer"
    t.string "image"
    t.boolean "status"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies_movietypes", force: :cascade do |t|
    t.integer "moive_id"
    t.integer "movietype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["moive_id"], name: "index_movies_movietypes_on_moive_id"
    t.index ["movietype_id"], name: "index_movies_movietypes_on_movietype_id"
  end

  create_table "movietypes", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "show_case"
    t.date "date_movie"
    t.boolean "status"
    t.integer "movie_id"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_schedules_on_movie_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "num_of_row"
    t.integer "num_of_collum"
    t.boolean "seat_type"
    t.integer "cinemaroom_id"
    t.boolean "status"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinemaroom_id"], name: "index_seats_on_cinemaroom_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.integer "moive_id"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["moive_id"], name: "index_studios_on_moive_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "pay_ticket"
    t.boolean "status"
    t.boolean "is_delete"
    t.integer "seat_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seat_id"], name: "index_tickets_on_seat_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "address"
    t.string "phone"
    t.boolean "status"
    t.string "email"
    t.integer "role"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
