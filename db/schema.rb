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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121019122636) do

  create_table "folders", :force => true do |t|
    t.integer  "year"
    t.string   "code"
    t.integer  "docid"
    t.string   "name"
    t.integer  "semester"
    t.integer  "pensum_id"
    t.string   "preinscription_date"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "magisterName"
  end

  create_table "folders_subjects", :id => false, :force => true do |t|
    t.integer "folder_id"
    t.integer "subject_id"
  end

  create_table "magisters", :force => true do |t|
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pensums", :force => true do |t|
    t.integer  "year"
    t.integer  "semester"
    t.string   "magister_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "preinscriptions", :force => true do |t|
    t.string   "subject_id"
    t.integer  "enrolled"
    t.string   "pensum_id"
    t.string   "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schedules", :force => true do |t|
    t.string   "pensum_id"
    t.string   "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sections", :force => true do |t|
    t.integer  "day"
    t.integer  "hour"
    t.string   "pensum_id"
    t.string   "subject_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "provisional"
  end

  create_table "subjects", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "credits"
    t.string   "pensum_id"
    t.integer  "blocks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "capacity"
  end

end
