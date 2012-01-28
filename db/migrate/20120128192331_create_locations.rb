class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.float :long
      t.float :lat
      t.string :name

      t.timestamps
    end
  end
end
