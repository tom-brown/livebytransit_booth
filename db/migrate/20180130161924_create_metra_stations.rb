class CreateMetraStations < ActiveRecord::Migration
  def change
    create_table :metra_stations do |t|
      t.float :lat
      t.float :lng

      t.timestamps

    end
  end
end
