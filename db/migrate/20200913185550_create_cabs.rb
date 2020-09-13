class CreateCabs < ActiveRecord::Migration[6.0]
  def change
    create_table :cabs do |t|
      t.string :reg_num
      t.string :status
      t.string :color
      t.string :modelname
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
