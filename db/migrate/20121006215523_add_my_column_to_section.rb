class AddMyColumnToSection < ActiveRecord::Migration
  def change
    add_column :sections, :provisional, :integer
  end
end
