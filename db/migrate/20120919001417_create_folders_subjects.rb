class CreateFoldersSubjects < ActiveRecord::Migration
 
	def change
	 	create_table :folders_subjects, :id => false do |t|
 			t.integer :folder_id
 			t.integer :subjects_id
	 	end
	end
end
