class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.float :starting_lat
      t.float :starting_long
      t.float :ending_lat
      t.float :ending_long
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.references :customer, null: false, foreign_key: true
      t.references :cab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
