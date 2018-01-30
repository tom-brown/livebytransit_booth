class CreateCtaStations < ActiveRecord::Migration
  def change
    create_table :cta_stations do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.string :address

      t.timestamps

    end
  end
end
