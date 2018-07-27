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

ActiveRecord::Schema.define(version: 20180616063803) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "attends", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "rest_start_at"
    t.datetime "rest_end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attends_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_comments_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "worker_id"
    t.string "company"
    t.string "company_short"
    t.string "first_name"
    t.string "last_name"
    t.string "first_kana"
    t.string "last_kana"
    t.string "tel"
    t.string "mobile"
    t.string "fax"
    t.string "e_mail"
    t.string "postnumber"
    t.string "prefecture"
    t.string "city"
    t.string "town"
    t.string "caption"
    t.string "labor_number"
    t.string "employment_number"
    t.date "trial_period"
    t.integer "work_start"
    t.integer "break_in"
    t.integer "break_out"
    t.integer "work_out"
    t.string "holiday"
    t.string "allowance"
    t.string "allowance_contents"
    t.date "closing_on"
    t.date "payment_on"
    t.string "desuction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
    t.index ["worker_id"], name: "index_companies_on_worker_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data", force: :cascade do |t|
    t.string "updata"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_data_on_company_id"
  end

  create_table "employments", force: :cascade do |t|
    t.string "trial_period"
    t.string "work_start"
    t.string "break_in"
    t.string "break_out"
    t.string "work_out"
    t.string "holiday"
    t.string "allowance"
    t.string "allowance_contents"
    t.string "closing_on"
    t.string "payment_on"
    t.string "method_payment"
    t.string "desuction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string "title"
    t.string "select"
    t.string "contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infos", force: :cascade do |t|
    t.string "limited_progress"
    t.string "limited_start"
    t.string "limited_each_name"
    t.string "limited_each_start"
    t.string "limited_each_curriculum"
    t.string "limited_offjt_time"
    t.string "limited_ojt_time"
    t.string "limited_supply"
    t.string "limited_comment"
    t.string "carriaup_progress"
    t.string "carriaup_start"
    t.string "carriaup_each_name"
    t.string "carriaup_each_limited_start"
    t.string "carriaup_each_regular"
    t.string "carriaup_each_supply"
    t.string "carriaup_comment"
    t.string "system_progress"
    t.string "system_start"
    t.string "system_subsidyname"
    t.string "system_each_name"
    t.string "system_implementation"
    t.string "system_supply"
    t.string "system_comment"
    t.string "limited_progreass"
    t.string "system_name"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_infos_on_company_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "status"
    t.string "deadline"
    t.string "payment"
    t.string "introduction"
    t.string "subject"
    t.string "product"
    t.string "price"
    t.string "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "picture"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_pictures_on_company_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "labor"
    t.string "minimum_wage"
    t.string "type"
    t.string "method"
    t.integer "tel"
    t.string "post"
    t.string "address"
    t.string "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "tel"
    t.string "e_mail"
    t.string "post_number"
    t.string "address"
    t.string "birthday"
    t.string "classification"
    t.string "authority"
    t.string "hire_date"
    t.string "departure_date"
    t.string "affiliation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end