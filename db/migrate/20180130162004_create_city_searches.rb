class CreateCitySearches < ActiveRecord::Migration
  def change
    create_table :city_searches do |t|
      t.integer :search_id
      t.integer :city_id

      t.timestamps

    end
  end
end
