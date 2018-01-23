class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.string :lat
      t.string :lng

      t.timestamps

    end
  end
end
