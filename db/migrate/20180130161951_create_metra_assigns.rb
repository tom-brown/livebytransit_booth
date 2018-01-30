class CreateMetraAssigns < ActiveRecord::Migration
  def change
    create_table :metra_assigns do |t|
      t.integer :metra_line_id
      t.integer :metra_station_id

      t.timestamps

    end
  end
end
