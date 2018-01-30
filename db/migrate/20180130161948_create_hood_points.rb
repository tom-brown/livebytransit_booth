class CreateHoodPoints < ActiveRecord::Migration
  def change
    create_table :hood_points do |t|
      t.integer :neighborhood_id
      t.string :lat
      t.string :lng

      t.timestamps

    end
  end
end
