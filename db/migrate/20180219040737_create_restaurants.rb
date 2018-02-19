class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :price

      t.timestamps
    end
  end
end
