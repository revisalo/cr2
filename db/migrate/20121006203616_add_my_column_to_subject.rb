class AddMyColumnToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :capacity, :integer
  end
end
