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

ActiveRecord::Schema.define(version: 20180503041744) do

  create_table "cinemarooms", force: :cascade do |t|
    t.string "name"
    t.text "descreption"
    t.boolean "status"
    t.integer "sum_of_row"
    t.integer "sum_of_collum"
    t.boolean "is_delete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.date "year_produced"
    t.integer "broadcasting_time"
    t.text "descreption"
    t.string "trailer"
    t.string "image"
    t.boolean "status"
    t.integer "studio_id"
    t.boolean "is_delete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_movies_on_studio_id"
  end

  create_table "movies_movietypes", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "movietype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movies_movietypes_on_movie_id"
    t.index ["movietype_id"], name: "index_movies_movietypes_on_movietype_id"
  end

  create_table "movietypes", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.boolean "is_delete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_times", force: :cascade do |t|
    t.string "start_time"
    t.string "end_time"
    t.boolean "status"
    t.boolean "is_delete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "schedule_time_id"
    t.date "date_movie"
    t.boolean "status"
    t.integer "movie_id"
    t.integer "cinemaroom_id"
    t.boolean "is_delete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinemaroom_id"], name: "index_schedules_on_cinemaroom_id"
    t.index ["movie_id"], name: "index_schedules_on_movie_id"
    t.index ["schedule_time_id"], name: "index_schedules_on_schedule_time_id"
  end

  create_table "seat_types", force: :cascade do |t|
    t.integer "pay_ticket"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.integer "seat_type_id"
    t.string "num_of_row"
    t.integer "num_of_collum"
    t.boolean "status"
    t.integer "cinemaroom_id"
    t.boolean "is_delete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinemaroom_id"], name: "index_seats_on_cinemaroom_id"
    t.index ["seat_type_id"], name: "index_seats_on_seat_type_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.boolean "is_delete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "seat_id"
    t.integer "schedule_id"
    t.integer "user_id"
    t.boolean "status"
    t.boolean "is_delete", default: false
    t.integer "find_or_create_by", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_tickets_on_schedule_id"
    t.index ["seat_id"], name: "index_tickets_on_seat_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "role", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

end
