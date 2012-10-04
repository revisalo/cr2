class AddMagisterNameToFolder < ActiveRecord::Migration
  def change
    add_column :folders, :magisterName, :string
  end
end
