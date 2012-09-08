class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :number
      t.string :teacher
      t.string :subject_id

      t.timestamps
    end
  end
end
