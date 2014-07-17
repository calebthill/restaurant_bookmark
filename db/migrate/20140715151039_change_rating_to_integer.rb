class ChangeRatingToInteger < ActiveRecord::Migration
  def up
    remove_column :restaurants, :rating
  end

  def down
    add_column :restaurants, :rating, :integer
  end
end
