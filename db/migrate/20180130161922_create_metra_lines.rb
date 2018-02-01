class CreateMetraLines < ActiveRecord::Migration
  def change
    create_table :metra_lines do |t|

      t.timestamps

    end
  end
end
