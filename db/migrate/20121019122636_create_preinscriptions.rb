class CreatePreinscriptions < ActiveRecord::Migration
  def change
    create_table :preinscriptions do |t|
      t.string :subject_id
      t.integer :enrolled
      t.string :pensum_id

      t.timestamps
    end
  end
end
