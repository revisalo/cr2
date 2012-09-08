class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :code
      t.string :name
      t.int :credits
      t.string :folder_id
      t.string :pensum_id

      t.timestamps
    end
  end
end
