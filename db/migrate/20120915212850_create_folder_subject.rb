class CreateFolderSubject < ActiveRecord::Migration
def change
 	create_table :subjects_folders, :id => false do |t|
 		t.integer :subject_id
 		t.integer :folder_id
 	end
 	end
end
