class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :phone
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode
      t.integer :user_id

      t.timestamps
    end
  end
end
