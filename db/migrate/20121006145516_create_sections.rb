class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :subject
      t.integer :day
      t.integer :hour

      t.timestamps
    end
  end
end
