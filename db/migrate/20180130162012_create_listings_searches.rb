class CreateListingsSearches < ActiveRecord::Migration
  def change
    create_table :listings_searches do |t|
      t.integer :listing_id
      t.integer :search_id

      t.timestamps

    end
  end
end
