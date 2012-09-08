class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.integer :year
      t.string :code
      t.integer :docid
      t.string :name
      t.integer :semester

      t.timestamps
    end
  end
end
