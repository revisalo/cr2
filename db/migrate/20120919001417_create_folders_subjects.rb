class CreateFoldersSubjects < ActiveRecord::Migration
 
	def change
	 create_table :folders_subjects, :id => false do |t|
 		t.integer :bookmark_id
 		t.integer :tag_id
	end
end
