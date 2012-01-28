class Adduserid < ActiveRecord::Migration
  def up
    change_table :items do |t|
      t.integer :user_id
    end
  end

  def down
  end
end
