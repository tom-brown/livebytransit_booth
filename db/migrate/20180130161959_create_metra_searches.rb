class CreateMetraSearches < ActiveRecord::Migration
  def change
    create_table :metra_searches do |t|
      t.integer :search_id
      t.integer :metra_station_id

      t.timestamps

    end
  end
end
