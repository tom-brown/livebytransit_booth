class CreateCtaLines < ActiveRecord::Migration
  def change
    create_table :cta_lines do |t|
      t.string :name

      t.timestamps

    end
  end
end
