class CreateCtaSearches < ActiveRecord::Migration
  def change
    create_table :cta_searches do |t|
      t.integer :search_id
      t.integer :cta_station_id

      t.timestamps

    end
  end
end
