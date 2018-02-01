class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.string :property_type
      t.integer :beds
      t.float :baths
      t.integer :max_price
      t.boolean :rental
      t.boolean :cats
      t.boolean :dogs
      t.string :cta_distance
      t.string :metra_distance
      t.string :parking
      t.string :laundry
      t.string :name
      t.integer :min_price
      t.text :old_mlsids
      t.text :current_mlsids
      t.text :new_mlsids

      t.timestamps

    end
  end
end
