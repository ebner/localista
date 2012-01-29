class Addcategory < ActiveRecord::Migration
  def up
     add_column :users, :category, :string
  end

  def down
  end
end
