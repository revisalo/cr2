class AddPensumIdToFolder < ActiveRecord::Migration
	#metodo que agrega una columna a la tabla folders
  def change
    add_column :folders, :pensum_id, :string
  end
end
