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

ActiveRecord::Schema.define(version: 20180512050235) do

  create_table "addresses", force: :cascade do |t|
    t.text     "street"
    t.string   "country"
    t.string   "city"
    t.integer  "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "article_managers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "course_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_managers_on_article_id"
    t.index ["course_id"], name: "index_article_managers_on_course_id"
    t.index ["project_id"], name: "index_article_managers_on_project_id"
    t.index ["user_id"], name: "index_article_managers_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "article_cover_file_name"
    t.string   "article_cover_content_type"
    t.integer  "article_cover_file_size"
    t.datetime "article_cover_updated_at"
    t.string   "category"
    t.float    "reward"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_managers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "course_id"
    t.integer  "project_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["article_id"], name: "index_category_managers_on_article_id"
    t.index ["category_id"], name: "index_category_managers_on_category_id"
    t.index ["course_id"], name: "index_category_managers_on_course_id"
    t.index ["project_id"], name: "index_category_managers_on_project_id"
    t.index ["user_id"], name: "index_category_managers_on_user_id"
  end

  create_table "comment_managers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "comment_id"
    t.integer  "course_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comment_managers_on_article_id"
    t.index ["comment_id"], name: "index_comment_managers_on_comment_id"
    t.index ["course_id"], name: "index_comment_managers_on_course_id"
    t.index ["project_id"], name: "index_comment_managers_on_project_id"
    t.index ["user_id"], name: "index_comment_managers_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "pin"
    t.boolean  "verification"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "information", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_managers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "address_id"
    t.integer  "contact_id"
    t.integer  "rank_id"
    t.integer  "skill_id"
    t.integer  "social_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_profile_managers_on_address_id"
    t.index ["contact_id"], name: "index_profile_managers_on_contact_id"
    t.index ["rank_id"], name: "index_profile_managers_on_rank_id"
    t.index ["skill_id"], name: "index_profile_managers_on_skill_id"
    t.index ["social_id"], name: "index_profile_managers_on_social_id"
    t.index ["user_id"], name: "index_profile_managers_on_user_id"
  end

  create_table "project_tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_tasks_on_project_id"
    t.index ["task_id"], name: "index_project_tasks_on_task_id"
    t.index ["user_id"], name: "index_project_tasks_on_user_id"
  end

  create_table "project_votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vote_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_votes_on_project_id"
    t.index ["user_id"], name: "index_project_votes_on_user_id"
    t.index ["vote_id"], name: "index_project_votes_on_vote_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.float    "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "article_reward"
    t.float    "project_reward"
  end

  create_table "reaction_managers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "course_id"
    t.integer  "project_id"
    t.integer  "reaction_id"
    t.integer  "comment_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["article_id"], name: "index_reaction_managers_on_article_id"
    t.index ["comment_id"], name: "index_reaction_managers_on_comment_id"
    t.index ["course_id"], name: "index_reaction_managers_on_course_id"
    t.index ["project_id"], name: "index_reaction_managers_on_project_id"
    t.index ["reaction_id"], name: "index_reaction_managers_on_reaction_id"
    t.index ["user_id"], name: "index_reaction_managers_on_user_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socials", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_managers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.integer  "project_id"
    t.integer  "article_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_status_managers_on_article_id"
    t.index ["course_id"], name: "index_status_managers_on_course_id"
    t.index ["project_id"], name: "index_status_managers_on_project_id"
    t.index ["status_id"], name: "index_status_managers_on_status_id"
    t.index ["user_id"], name: "index_status_managers_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_user_courses_on_course_id"
    t.index ["user_id"], name: "index_user_courses_on_user_id"
  end

  create_table "user_informations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "information_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["information_id"], name: "index_user_informations_on_information_id"
    t.index ["user_id"], name: "index_user_informations_on_user_id"
  end

  create_table "user_projects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "user_wallets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "vest_id"
    t.index ["user_id"], name: "index_user_wallets_on_user_id"
    t.index ["vest_id"], name: "index_user_wallets_on_vest_id"
    t.index ["wallet_id"], name: "index_user_wallets_on_wallet_id"
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vests", force: :cascade do |t|
    t.string   "name"
    t.float    "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expire_at"
  end

  create_table "votes", force: :cascade do |t|
    t.float    "weight"
    t.string   "vote_type"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.string   "label"
    t.string   "address"
    t.float    "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
