class CreateShowings < ActiveRecord::Migration
  def change
    create_table :showings do |t|
      t.integer :user_id
      t.integer :listing_id
      t.text :message
      t.datetime :date

      t.timestamps

    end
  end
end
