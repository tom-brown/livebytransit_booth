class AddListingCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :listings_count, :integer
  end
end
