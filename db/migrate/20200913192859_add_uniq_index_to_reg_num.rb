class AddUniqIndexToRegNum < ActiveRecord::Migration[6.0]
  def change
    add_index :cabs, :reg_num, unique: true
  end
end
