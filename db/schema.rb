# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_06_061612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shorten_urls", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_0", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_1", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_2", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_3", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_4", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_5", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_6", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_7", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_8", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_9", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_a", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_b", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_c", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_d", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_e", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_f", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_g", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_h", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_i", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_j", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_k", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_l", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_m", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_n", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_o", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_p", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_q", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_r", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_s", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_t", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_u", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_v", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_w", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_x", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_y", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

  create_table "urls_start_z", primary_key: ["slug", "part"], force: :cascade do |t|
    t.string "original_url", null: false
    t.string "slug", null: false
    t.string "part", null: false
    t.datetime "created_at"
  end

end
