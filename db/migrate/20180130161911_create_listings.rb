class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.string :lat
      t.string :lng
      t.integer :user_id
      t.integer :beds
      t.integer :baths
      t.integer :half_baths
      t.text :description
      t.integer :garage_spaces
      t.integer :assigned_parking
      t.boolean :active
      t.integer :age
      t.string :size
      t.integer :city_id
      t.boolean :heat_gas
      t.boolean :heat_radiator
      t.boolean :ac_window_units
      t.boolean :ac_central
      t.date :list_date
      t.string :pin
      t.boolean :recent_rehab
      t.boolean :vintage
      t.boolean :new_construction
      t.integer :price
      t.boolean :rental
      t.string :state
      t.string :st_num
      t.string :street
      t.string :st_suffix
      t.string :cp
      t.string :unit
      t.string :zip_code
      t.string :property_type
      t.string :laundry
      t.boolean :cats
      t.boolean :dogs
      t.date :available_date
      t.text :image_urls
      t.integer :neighborhood_id
      t.integer :picture_count
      t.string :mls_id
      t.string :lo_mlsid
      t.string :la_first_name
      t.string :la_last_name
      t.float :total_baths

      t.timestamps

    end
  end
end
