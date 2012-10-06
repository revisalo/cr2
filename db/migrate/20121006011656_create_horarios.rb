class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.string :materia
      t.integer :dia
      t.integer :hora

      t.timestamps
    end
  end
end
