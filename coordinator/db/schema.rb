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

ActiveRecord::Schema.define(:version => 20120908181110) do

  create_table "carpeta", :force => true do |t|
    t.string   "nombre"
    t.integer  "codigo"
    t.integer  "docid"
    t.integer  "anoingreso"
    t.integer  "semestre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "maestria", :force => true do |t|
    t.string   "codigo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "materia", :force => true do |t|
    t.string   "nombre"
    t.string   "codigo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pensums", :force => true do |t|
    t.integer  "ano"
    t.integer  "semestre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seccions", :force => true do |t|
    t.integer  "numero"
    t.integer  "creditos"
    t.string   "profesor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
