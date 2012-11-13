class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :pensum_id
      t.string :section_id

      t.timestamps
    end
  end
end
