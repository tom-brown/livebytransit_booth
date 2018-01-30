class CreateCtaAssigns < ActiveRecord::Migration
  def change
    create_table :cta_assigns do |t|
      t.integer :cta_station_id
      t.integer :cta_line_id

      t.timestamps

    end
  end
end
