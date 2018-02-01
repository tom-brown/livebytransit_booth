class CreateHoodSearches < ActiveRecord::Migration
  def change
    create_table :hood_searches do |t|
      t.integer :neighborhood_id
      t.integer :search_id

      t.timestamps

    end
  end
end
