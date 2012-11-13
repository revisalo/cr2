class CreateMagisters < ActiveRecord::Migration
  def change
    create_table :magisters do |t|
      t.string :code

      t.timestamps
    end
  end
end
