class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :day
      t.integer :hour
      t.string :pensum_id
      t.string :subject_id

      t.timestamps
    end
  end
end
