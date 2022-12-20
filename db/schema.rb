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

ActiveRecord::Schema.define(version: 2022_12_20_141958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.integer "person_id"
    t.integer "conference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "day_id"
    t.index ["conference_id"], name: "index_availabilities_on_conference_id"
    t.index ["person_id"], name: "index_availabilities_on_person_id"
  end

  create_table "average_review_scores", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "review_metric_id"
    t.float "score"
    t.index ["event_id", "review_metric_id"], name: "index_average_review_scores_on_event_id_and_review_metric_id", unique: true
    t.index ["event_id"], name: "index_average_review_scores_on_event_id"
    t.index ["review_metric_id"], name: "index_average_review_scores_on_review_metric_id"
  end

  create_table "call_for_participations", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.date "hard_deadline"
    t.text "welcome_text"
    t.integer "conference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "info_url"
    t.string "contact_email"
    t.index ["start_date", "end_date"], name: "index_call_for_papers_on_dates"
  end

  create_table "classifiers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "conference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_id"], name: "index_classifiers_on_conference_id"
  end

  create_table "conference_exports", force: :cascade do |t|
    t.string "locale"
    t.bigint "conference_id"
    t.string "tarball_file_name"
    t.string "tarball_content_type"
    t.integer "tarball_file_size"
    t.datetime "tarball_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_id"], name: "index_conference_exports_on_conference_id"
  end

  create_table "conference_users", force: :cascade do |t|
    t.string "role"
    t.bigint "user_id"
    t.bigint "conference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_id"], name: "index_conference_users_on_conference_id"
    t.index ["user_id"], name: "index_conference_users_on_user_id"
  end

  create_table "conferences", force: :cascade do |t|
    t.string "acronym", null: false
    t.string "title", null: false
    t.string "timezone", default: "Berlin", null: false
    t.integer "timeslot_duration", default: 15, null: false
    t.integer "default_timeslots", default: 3, null: false
    t.integer "max_timeslots", default: 20, null: false
    t.boolean "feedback_enabled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "program_export_base_url"
    t.string "schedule_version"
    t.boolean "schedule_public", default: false, null: false
    t.string "color"
    t.string "ticket_type", default: "integrated"
    t.boolean "event_state_visible", default: true
    t.text "schedule_custom_css"
    t.text "schedule_html_intro"
    t.string "default_recording_license"
    t.boolean "expenses_enabled", default: false, null: false
    t.boolean "transport_needs_enabled", default: false, null: false
    t.bigint "parent_id"
    t.boolean "bulk_notification_enabled", default: false, null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.bigint "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean "schedule_open", default: false, null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "attachment_title_is_freeform", default: true
    t.string "allowed_event_types", default: "lecture;workshop;podium;lightning_talk;meeting;film;concert;djset;performance;other"
    t.string "allowed_event_timeslots_csv", limit: 400
    t.string "bcc_address", limit: 255
    t.index ["acronym"], name: "index_conferences_on_acronym"
    t.index ["parent_id"], name: "index_conferences_on_parent_id"
  end

  create_table "conflicts", force: :cascade do |t|
    t.integer "event_id"
    t.integer "conflicting_event_id"
    t.integer "person_id"
    t.string "conflict_type"
    t.string "severity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "conflicting_event_id"], name: "index_conflicts_on_event_id"
    t.index ["person_id"], name: "index_conflicts_on_person_id"
  end

  create_table "days", force: :cascade do |t|
    t.integer "conference_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["conference_id"], name: "index_days_on_conference"
  end

  create_table "event_attachments", force: :cascade do |t|
    t.integer "event_id", null: false
    t.string "title", null: false
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.integer "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public", default: true
    t.index ["event_id"], name: "index_event_attachments_on_event_id"
  end

  create_table "event_classifiers", force: :cascade do |t|
    t.integer "value", default: 0
    t.bigint "classifier_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classifier_id"], name: "index_event_classifiers_on_classifier_id"
    t.index ["event_id"], name: "index_event_classifiers_on_event_id"
  end

  create_table "event_feedbacks", force: :cascade do |t|
    t.integer "event_id"
    t.float "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_feedbacks_on_event_id"
  end

  create_table "event_people", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "person_id", null: false
    t.string "event_role", default: "submitter", null: false
    t.string "role_state"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.string "notification_subject", limit: 255
    t.text "notification_body"
    t.index ["event_id"], name: "index_event_people_on_event_id"
    t.index ["person_id"], name: "index_event_people_on_person_id"
  end

  create_table "event_ratings", force: :cascade do |t|
    t.integer "event_id"
    t.integer "person_id"
    t.float "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "peer", default: false
    t.index ["event_id"], name: "index_event_ratings_on_event_id"
    t.index ["person_id"], name: "index_event_ratings_on_person_id"
  end

  create_table "event_translations", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "abstract"
    t.text "description"
    t.string "locale", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "locale"], name: "index_event_translations_on_event_id_and_locale", unique: true
    t.index ["locale"], name: "index_event_translations_on_locale"
  end

  create_table "events", force: :cascade do |t|
    t.integer "conference_id", null: false
    t.string "title"
    t.string "subtitle"
    t.string "event_type", default: "talk"
    t.integer "time_slots", default: 3
    t.string "state", default: "new", null: false
    t.string "language"
    t.datetime "start_time"
    t.text "abstract"
    t.text "description"
    t.boolean "public", default: true
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer "track_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "average_rating"
    t.integer "event_ratings_count", default: 0
    t.text "note"
    t.text "submission_note"
    t.integer "speaker_count", default: 0
    t.integer "event_feedbacks_count", default: 0
    t.float "average_feedback"
    t.string "guid"
    t.boolean "do_not_record", default: false
    t.string "recording_license"
    t.text "tech_rider"
    t.string "invite_token"
    t.string "video_url", limit: 255
    t.text "coauthors"
    t.string "coauthor_1"
    t.string "coauthor_2"
    t.string "coauthor_3"
    t.string "coauthor_4"
    t.string "coauthor_5"
    t.string "coauthor_1_name"
    t.string "coauthor_1_last_name"
    t.string "coauthor_2_name"
    t.string "coauthor_2_last_name"
    t.string "coauthor_3_name"
    t.string "coauthor_3_last_name"
    t.string "coauthor_4_name"
    t.string "coauthor_4_last_name"
    t.string "coauthor_5_name"
    t.string "coauthor_5_last_name"
    t.index ["conference_id"], name: "index_events_on_conference_id"
    t.index ["event_type"], name: "index_events_on_type"
    t.index ["guid"], name: "index_events_on_guid", unique: true
    t.index ["invite_token"], name: "index_events_on_invite_token", unique: true
    t.index ["state"], name: "index_events_on_state"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "name"
    t.decimal "value", precision: 9, scale: 4
    t.boolean "reimbursed"
    t.bigint "person_id"
    t.bigint "conference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_id"], name: "index_expenses_on_conference_id"
    t.index ["person_id"], name: "index_expenses_on_person_id"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "user_id"
    t.integer "paper_id"
    t.integer "value"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "im_accounts", force: :cascade do |t|
    t.integer "person_id"
    t.string "im_type"
    t.string "im_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_im_accounts_on_person_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "code"
    t.integer "attachable_id"
    t.string "attachable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachable_id"], name: "index_languages_on_attachable_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "title", null: false
    t.string "url", null: false
    t.integer "linkable_id", null: false
    t.string "linkable_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linkable_id"], name: "index_links_on_linkable_id"
  end

  create_table "mail_templates", force: :cascade do |t|
    t.bigint "conference_id"
    t.string "name"
    t.string "subject"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_id"], name: "index_mail_templates_on_conference_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale"
    t.string "accept_subject"
    t.string "reject_subject"
    t.text "accept_body"
    t.text "reject_body"
    t.integer "conference_id"
    t.string "schedule_subject", limit: 255
    t.text "schedule_body"
  end

  create_table "papers", force: :cascade do |t|
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.string "public_name", null: false
    t.string "email", null: false
    t.boolean "email_public", default: true
    t.string "gender"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text "abstract"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "note"
    t.boolean "include_in_mailings", default: false, null: false
    t.boolean "use_gravatar", default: false, null: false
    t.index ["email"], name: "index_people_on_email"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "person_translations", force: :cascade do |t|
    t.text "abstract"
    t.text "description"
    t.string "locale", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locale"], name: "index_person_translations_on_locale"
    t.index ["person_id", "locale"], name: "index_person_translations_on_person_id_and_locale", unique: true
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.integer "person_id"
    t.string "phone_type"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_phone_numbers_on_person_id"
  end

  create_table "review_metrics", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "conference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_id"], name: "index_review_metrics_on_conference_id"
    t.index ["name", "conference_id"], name: "index_review_metrics_on_name_and_conference_id", unique: true
  end

  create_table "review_scores", force: :cascade do |t|
    t.bigint "event_rating_id"
    t.bigint "review_metric_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_rating_id"], name: "index_review_scores_on_event_rating_id"
    t.index ["review_metric_id"], name: "index_review_scores_on_review_metric_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "conference_id", null: false
    t.string "name", null: false
    t.integer "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rank"
    t.index ["conference_id"], name: "index_rooms_on_conference_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id"
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "ticket_servers", force: :cascade do |t|
    t.integer "conference_id", null: false
    t.string "url"
    t.string "user"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "queue"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "object_id", null: false
    t.string "remote_ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "object_type"
    t.index ["object_id"], name: "index_tickets_on_object_id"
  end

  create_table "track_translations", force: :cascade do |t|
    t.string "name"
    t.string "locale", null: false
    t.bigint "track_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locale"], name: "index_track_translations_on_locale"
    t.index ["track_id", "locale"], name: "index_track_translations_on_track_id_and_locale", unique: true
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "conference_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color", default: "fefd7f"
    t.index ["conference_id"], name: "index_tracks_on_conference_id"
  end

  create_table "transport_needs", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "conference_id"
    t.datetime "at"
    t.string "transport_type"
    t.integer "seats"
    t.boolean "booked"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_id"], name: "index_transport_needs_on_conference_id"
    t.index ["person_id"], name: "index_transport_needs_on_person_id"
  end

  create_table "user_adapter", force: :cascade do |t|
    t.integer "number_of_papers_evaluated", default: 0, null: false
    t.integer "papers_evaluated", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "papers_array", default: [], array: true
  end

  create_table "user_adapters", force: :cascade do |t|
    t.integer "number_of_papers_evaluated", default: 0, null: false
    t.integer "papers_evaluated", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "skipped", default: [], array: true
    t.integer "accepted", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "reset_password_token"
    t.datetime "remember_created_at"
    t.string "remember_token"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "submitter"
    t.string "encrypted_password", default: "", null: false
    t.datetime "reset_password_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "provider"
    t.string "uid"
    t.boolean "gdpr"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.integer "conference_id"
    t.integer "associated_id"
    t.string "associated_type"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "average_review_scores", "events"
  add_foreign_key "average_review_scores", "review_metrics"
  add_foreign_key "classifiers", "conferences"
  add_foreign_key "event_classifiers", "classifiers"
  add_foreign_key "event_classifiers", "events"
  add_foreign_key "event_translations", "events"
  add_foreign_key "person_translations", "people"
  add_foreign_key "review_metrics", "conferences"
  add_foreign_key "review_scores", "event_ratings"
  add_foreign_key "review_scores", "review_metrics"
  add_foreign_key "track_translations", "tracks"
end
