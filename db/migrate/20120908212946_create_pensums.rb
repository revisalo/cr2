class CreatePensums < ActiveRecord::Migration
  def change
    create_table :pensums do |t|
      t.integer :year
      t.integer :semester
      t.string :magister_id

      t.timestamps
    end
  end
end
