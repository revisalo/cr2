class CreateTableFoldersSubjects < ActiveRecord::Migration
  def change
  	create_table :folders_subjects, :id => false do |t|
  		t.integer :subject_id
  		t.integer :folder_id
  	end

  	add_index :folders_subjects, [:subject_id, :folder_id], :unique => true
  end
end
