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

ActiveRecord::Schema.define(version: 20151007011309) do

  create_table "financings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "find_outs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "find_outs_info_requests", id: false, force: :cascade do |t|
    t.integer "info_request_id", limit: 4, null: false
    t.integer "find_out_id",     limit: 4, null: false
  end

  create_table "find_outs_postulations", id: false, force: :cascade do |t|
    t.integer "postulation_id", limit: 4, null: false
    t.integer "find_out_id",    limit: 4, null: false
  end

  create_table "info_requests", force: :cascade do |t|
    t.integer  "program_id",          limit: 4
    t.string   "name",                limit: 255
    t.string   "surname",             limit: 255
    t.string   "second_surname",      limit: 255
    t.string   "contact_phone",       limit: 255
    t.string   "rut",                 limit: 255
    t.text     "observations",        limit: 65535
    t.integer  "find_out_id",         limit: 4
    t.string   "find_out_other",      limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "email",               limit: 255
    t.text     "internal_commentary", limit: 65535
  end

  add_index "info_requests", ["find_out_id"], name: "index_info_requests_on_find_out_id", using: :btree
  add_index "info_requests", ["program_id"], name: "index_info_requests_on_program_id", using: :btree

  create_table "postulations", force: :cascade do |t|
    t.integer  "program_id",                           limit: 4
    t.string   "name",                                 limit: 255
    t.string   "surname",                              limit: 255
    t.string   "second_surname",                       limit: 255
    t.string   "rut",                                  limit: 255
    t.date     "birthdate"
    t.string   "birthplace",                           limit: 255
    t.string   "nationality",                          limit: 255
    t.string   "phone",                                limit: 255
    t.string   "mobile_phone",                         limit: 255
    t.string   "message_phone",                        limit: 255
    t.string   "email",                                limit: 255
    t.string   "address",                              limit: 255
    t.string   "commune",                              limit: 255
    t.string   "city",                                 limit: 255
    t.string   "degree_school",                        limit: 255
    t.string   "degree",                               limit: 255
    t.string   "degree_country",                       limit: 255
    t.integer  "degree_year",                          limit: 4
    t.string   "other_degree",                         limit: 255
    t.string   "other_degree_country",                 limit: 255
    t.integer  "other_degree_year",                    limit: 4
    t.string   "occupation",                           limit: 255
    t.string   "work_address",                         limit: 255
    t.string   "work_commune",                         limit: 255
    t.string   "work_city",                            limit: 255
    t.string   "work_phone",                           limit: 255
    t.string   "work_email",                           limit: 255
    t.text     "observations",                         limit: 65535
    t.integer  "find_out_id",                          limit: 4
    t.string   "find_out_other",                       limit: 255
    t.integer  "financing_id",                         limit: 4
    t.boolean  "no_continuation"
    t.string   "cv_file_name",                         limit: 255
    t.string   "cv_content_type",                      limit: 255
    t.integer  "cv_file_size",                         limit: 4
    t.datetime "cv_updated_at"
    t.string   "picture_file_name",                    limit: 255
    t.string   "picture_content_type",                 limit: 255
    t.integer  "picture_file_size",                    limit: 4
    t.datetime "picture_updated_at"
    t.string   "degree_1_file_name",                   limit: 255
    t.string   "degree_1_content_type",                limit: 255
    t.integer  "degree_1_file_size",                   limit: 4
    t.datetime "degree_1_updated_at"
    t.string   "degree_2_file_name",                   limit: 255
    t.string   "degree_2_content_type",                limit: 255
    t.integer  "degree_2_file_size",                   limit: 4
    t.datetime "degree_2_updated_at"
    t.string   "postulation_tab_file_name",            limit: 255
    t.string   "postulation_tab_content_type",         limit: 255
    t.integer  "postulation_tab_file_size",            limit: 4
    t.datetime "postulation_tab_updated_at"
    t.string   "inscription_receip_file_name",         limit: 255
    t.string   "inscription_receip_content_type",      limit: 255
    t.integer  "inscription_receip_file_size",         limit: 4
    t.datetime "inscription_receip_updated_at"
    t.string   "intention_letter_file_name",           limit: 255
    t.string   "intention_letter_content_type",        limit: 255
    t.integer  "intention_letter_file_size",           limit: 4
    t.datetime "intention_letter_updated_at"
    t.string   "ci_file_name",                         limit: 255
    t.string   "ci_content_type",                      limit: 255
    t.integer  "ci_file_size",                         limit: 4
    t.datetime "ci_updated_at"
    t.string   "recommendation_letter_1_file_name",    limit: 255
    t.string   "recommendation_letter_1_content_type", limit: 255
    t.integer  "recommendation_letter_1_file_size",    limit: 4
    t.datetime "recommendation_letter_1_updated_at"
    t.string   "recommendation_letter_2_file_name",    limit: 255
    t.string   "recommendation_letter_2_content_type", limit: 255
    t.integer  "recommendation_letter_2_file_size",    limit: 4
    t.datetime "recommendation_letter_2_updated_at"
    t.string   "tesis_proposal_file_name",             limit: 255
    t.string   "tesis_proposal_content_type",          limit: 255
    t.integer  "tesis_proposal_file_size",             limit: 4
    t.datetime "tesis_proposal_updated_at"
    t.string   "interest_declaration_file_name",       limit: 255
    t.string   "interest_declaration_content_type",    limit: 255
    t.integer  "interest_declaration_file_size",       limit: 4
    t.datetime "interest_declaration_updated_at"
    t.date     "folder_delivery"
    t.date     "interview"
    t.integer  "postulation_status",                   limit: 4
    t.integer  "enrollment_status",                    limit: 4
    t.integer  "tuition_status",                       limit: 4
    t.text     "intern_observations",                  limit: 65535
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.text     "internal_commentary",                  limit: 65535
  end

  add_index "postulations", ["financing_id"], name: "index_postulations_on_financing_id", using: :btree
  add_index "postulations", ["find_out_id"], name: "index_postulations_on_find_out_id", using: :btree
  add_index "postulations", ["program_id"], name: "index_postulations_on_program_id", using: :btree

  create_table "programs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255, default: "", null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "info_requests", "find_outs"
  add_foreign_key "info_requests", "programs"
  add_foreign_key "postulations", "financings"
  add_foreign_key "postulations", "find_outs"
  add_foreign_key "postulations", "programs"
end
