class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :code
      t.string :name
      t.integer :credits
      t.string :pensum_id
      t.integer :blocks

      t.timestamps
    end
  end
end
